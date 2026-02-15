declare global {
  interface CreepMemory {
    status?: CreepStatus
    spawnId?: Id<StructureSpawn>
    targetId?: Id<Source | Mineral<MineralConstant> | Deposit>
    role?: string
  }

  type CreepStatus = 'working' | 'idle' | null
}

export {}
