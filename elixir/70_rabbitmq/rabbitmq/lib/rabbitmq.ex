defmodule Rabbitmq do
  @moduledoc """
  Documentation for Rabbitmq.
  """

  def init do
    # {:ok, connection} = AMQP.Connection.open(host: '172.18.0.4')
    # {:ok, channel} = AMQP.Channel.open(connection)

    # AMQP.Queue.declare(channel, "hello")

    # AMQP.Basic.publish(channel, "", "hello", "Hello World!")
    # IO.puts " [x] Sent 'Hello World!'"

    {:ok, connection} = AMQP.Connection.open(host: '172.18.0.4')
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, "hello")
    AMQP.Basic.consume(channel, "hello", nil, no_ack: true)
    IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"

    AMQP.Basic.publish(channel, "", "hello", "Hello World!")
  end

end
