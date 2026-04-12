import nina
import std/os

echo "Connecting..."
let conn = connect("nats://127.0.0.1:4222")

echo "Subscribing..."
let sub = conn.subscribe("updates")

echo "Publishing..."
conn.publish("updates", "Hello from pure Nim!")

# Give the NATS background thread a moment to process the message and fire our callback
sleep(100)

echo "Done!"
