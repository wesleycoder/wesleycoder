const targetHarvesters = 4

const basicHarvesterBody = [WORK, CARRY, MOVE]
const basicHarvesterCost = basicHarvesterBody.reduce((acc, part) => acc + BODYPART_COST[part], 0)

export const loop = () => {
  for (const spawn of Object.values(Game.spawns)) {
    if (spawn.store.energy > basicHarvesterCost) {
      if (targetHarvesters >= Object.values(Game.creeps).filter((creep) => creep.memory.role === 'harvester').length) {
        if (spawn.spawnCreep(basicHarvesterBody, `harvester${Game.time}`, { memory: { role: 'harvester' } }) === OK) {
          console.log(`harvester${Game.time} spawning`)
        } else {
          console.log('Already have target number of harvesters')
        }
      }
    }
  }

  for (const creep of Object.values(Game.creeps)) {
    if (creep.memory.role === 'harvester') {
      if (creep.store.energy >= creep.store.getCapacity(RESOURCE_ENERGY)) {
        const target = creep.pos.findClosestByRange(FIND_MY_STRUCTURES, {
          filter: (structure) =>
            structure.structureType === STRUCTURE_EXTENSION && structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0 ||
            structure.structureType === STRUCTURE_SPAWN && structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0,
        })
        if (target) {
          if (creep.transfer(target, RESOURCE_ENERGY) === ERR_NOT_IN_RANGE) {
            creep.moveTo(target)
          } else if (creep.transfer(target, RESOURCE_ENERGY) === ERR_NOT_ENOUGH_RESOURCES) {
            console.log('not enough energy to transfer')
          }
        } else {
          console.log('no energy store found')
        }
      } else {
        const source = creep.pos.findClosestByRange(FIND_SOURCES_ACTIVE)
        if (source) {
          if (creep.harvest(source) === ERR_NOT_IN_RANGE) {
            creep.moveTo(source)
          } else if (creep.harvest(source) === ERR_NOT_ENOUGH_RESOURCES) {
            console.log('not enough energy to harvest')
          }
        } else {
          console.log('no source found')
        }
      }
    }
  }
}
