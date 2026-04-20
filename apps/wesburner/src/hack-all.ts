import { NS } from '@ns'

async function hackServer(ns: NS, host: string) {
  ns.printf(`Hacking ${host}`)
  await ns.hack(host)
  ns.printf(`Hacked ${host}`)
}

async function crackServer(ns: NS, host: string) {
  const portsNeeded = ns.getServerNumPortsRequired(host)
  if (portsNeeded > 0) {
    if (ns.fileExists('BruteSSH.exe', 'home')) {
      ns.brutessh(host)
    }
  }
  ns.nuke(host)
  const lvl = ns.getHackingLevel()
  if (lvl <= 1) {
    ns.printf(`Nuking ${host} (level ${lvl})`)
    ns.nuke(host)
    ns.printf(`Nuked ${host} (level ${lvl})`)
  }
}

export async function main(ns: NS) {
  const host = ns.getHostname()
  ns.ui.openTail('hack-all.js', host)
  ns.disableLog('scan')
  // ns.disableLog('nuke')
  ns.disableLog('hack')
  ns.disableLog('grow')
  ns.disableLog('weaken')
  // ns.disableLog('getHackingLevel')
  // ns.disableLog('getServerNumPortsRequired')
  ns.clearLog()

  if (host !== 'home') {
    ns.printf(`Not on home server: ${host}`)
    return
  }

  const connected = ns.scan()
  ns.printf(`${host}: ${connected.join(', ')}`)

  for (const server of connected) {
    await crackServer(ns, server)
    await hackServer(ns, server)
  }
}
