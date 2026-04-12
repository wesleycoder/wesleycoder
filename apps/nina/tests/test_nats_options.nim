import std/unittest
import std/os
import nina

suite "NATS Connection Options":
  test "Connect with custom options":
    let opts = newNatsOptions()

    opts.setUrl("nats://127.0.0.1:4222")
    opts.setMaxReconnect(5)
    opts.setReconnectWait(2000)

    let conn = connect(opts)

    var receivedData = new(string)

    let sub = conn.subscribe(
      "test.options",
      proc(subject: string, replyTo: string, data: string) {.closure, gcsafe.} =
        {.cast(gcsafe).}:
          receivedData[] = data,
    )

    conn.publish("test.options", "Options working perfectly")
    sleep(100)
    check receivedData[] == "Options working perfectly"
