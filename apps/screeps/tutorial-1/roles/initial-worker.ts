export const worker = {
  new(spawnId: Id<StructureSpawn>) {
    return {
      memory: {
        status: 'idle',
        spawnId: spawnId,
      } satisfies CreepMemory,
    }
  },
  run(creep: Creep) {
    if (creep.memory.status === 'working') {
      if (
        creep.transfer(Game.getObjectById(creep.memory.spawnId!)!, RESOURCE_ENERGY) ===
          ERR_NOT_IN_RANGE
      ) {
        creep.moveTo(Game.getObjectById(creep.memory.spawnId!)!)
      }
    } else {
      if (creep.harvest(Game.getObjectById(creep.memory.targetId!)!) === ERR_NOT_IN_RANGE) {
        creep.moveTo(Game.getObjectById(creep.memory.targetId!)!)
      }
    }
  },
}
