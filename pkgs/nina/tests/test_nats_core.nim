import std/unittest
import std/os
import nina

suite "NATS Core API":
  setup:
    let conn = connect("nats://127.0.0.1:4222")

  test "Publish and Subscribe":
    var receivedTopic = new(string)
    var receivedData = new(string)

    let sub = conn.subscribe(
      "test.pubsub",
      proc(subject: string, replyTo: string, data: string) {.closure, gcsafe.} =
        {.cast(gcsafe).}:
          receivedTopic[] = subject
          receivedData[] = data,
    )

    conn.publish("test.pubsub", "hello from core test")
    sleep(100)
    check receivedTopic[] == "test.pubsub"
    check receivedData[] == "hello from core test"

  test "Request and Reply (Microservice)":
    let sub = conn.subscribe(
      "test.service",
      proc(subject: string, replyTo: string, data: string) {.closure, gcsafe.} =
        {.cast(gcsafe).}:
          if replyTo.len > 0:
            conn.publish(replyTo, "echo: " & data)
      ,
    )

    let response = conn.request("test.service", "ping", timeoutMs = 1000)
    check response == "echo: ping"

  test "Request Timeout Handling":
    # Make a request to a subject with no listeners
    expect NatsError:
      discard conn.request("test.nowhere", "hello", timeoutMs = 100)
