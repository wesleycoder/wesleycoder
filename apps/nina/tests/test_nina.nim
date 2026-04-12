import nina
import std/os

let conn = connect("nats://127.0.0.1:4222")

# Elevate our connection to a JetStream Context
let js = conn.jetStream()

echo "Publishing durable message..."
# This will fail if the stream isn't created!
js.publish("orders.new", "Order #1234 - MacBook Pro")

echo "Starting Consumer..."
# Note we are subscribing to the JS context, not the Conn context
let sub = js.subscribe(
  "orders.*",
  proc(subject: string, replyTo: string, data: string) =
    echo "CONSUMER -> Processed durable message: ", data
  ,
)

sleep(100)
echo "Done!"
