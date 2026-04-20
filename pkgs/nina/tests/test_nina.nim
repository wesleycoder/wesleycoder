import
  nina
  std/os

let conn = connect("nats://127.0.0.1:4222")

let sub = conn.subscribe(
  "math.double",
  proc(subject: string, replyTo: string, data: string) =
    echo "SERVICE -> Received request on [", subject, "] with data: ", data

    if replyTo.len > 0:
      let response = "Double of " & data & " is coming right up!"
      echo "SERVICE -> Sending reply to temporary inbox: ", replyTo

      conn.publish(replyTo, response)
  ,
)

echo "CLIENT  -> Requesting math.double..."
try:
  let answer = conn.request("math.double", "42", timeoutMs = 2000)
  echo "CLIENT  -> Got answer: ", answer
except NatsError as e:
  echo "CLIENT  -> Error: ", e.msg

sleep(100)
