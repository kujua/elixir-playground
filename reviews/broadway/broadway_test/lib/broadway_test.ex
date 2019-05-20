defmodule BroadwayTest do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: RabbitBroadway,
      producers: [
        default: [
          module: {BroadwayRabbitMQ.Producer,
            queue: "images",
            qos: [
              prefetch_count: 50,
            ]
          },
          stages: 2
        ]
      ],
      processors: [
        default: [
          stages: 50
        ]
      ],
      batchers: [
        default: [
          batch_size: 10,
          batch_timeout: 1500,
          stages: 5
        ]
      ]
    )
  end

  def handle_message(_, message, _) do
    message
    |> Message.update_data(fn data -> {data, String.to_integer(data) * 2} end)
  end

  def handle_batch(_, messages, _, _) do
    list = messages |> Enum.map(fn e -> e.data end)
    IO.inspect(list, label: "Got batch")
    messages
  end
  
end
