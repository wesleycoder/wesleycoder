import
  nina
  std/[options, os, unittest]

suite "NATS JetStream API":
  setup:
    let conn = connect("nats://127.0.0.1:4222")
    let js = conn.jetStream()
    let info = js.getStreamInfo("ORDERS")

    if info.isNone():
      js.addStream("ORDERS", ["orders.*"])
    else:
      echo "Stream already exists! Bypassing creation."

  test "Durable Publish and Push Consumer":
    var receivedData = new(string)

    let sub = js.subscribe(
      "orders.testsuite",
      proc(subject: string, replyTo: string, data: string) {.closure, gcsafe.} =
        {.cast(gcsafe).}:
          receivedData[] = data,
    )

    js.publish("orders.testsuite", "Durable test payload")
    sleep(200)
    check receivedData[] == "Durable test payload"
