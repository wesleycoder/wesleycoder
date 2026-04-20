import
  nina
  std/[options, unittest]

suite "NATS Key-Value Store API":
  setup:
    let conn = connect("nats://127.0.0.1:4222")
    let js = conn.jetStream()
    let kv = js.createKeyValue("CONFIG")

  test "KV Put, Get, Delete, and Missing Keys":
    let missingVal = kv.get("this.key.does.not.exist")
    check missingVal.isNone()

    kv.put("server.status", "ONLINE")

    let activeVal = kv.get("server.status")
    check activeVal.isSome()
    check activeVal.get() == "ONLINE"

    kv.put("server.status", "MAINTENANCE")
    let updatedVal = kv.get("server.status")
    check updatedVal.get() == "MAINTENANCE"

    kv.delete("server.status")

    check kv.get("server.status").isNone()
