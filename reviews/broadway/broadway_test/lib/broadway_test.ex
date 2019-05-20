defmodule BroadwayTest do
  use Broadway

  alias Broadway.Message

#  def init(state) do
#    {:ok, %{}}
#  end

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

  def handle_message(_, %Message{data: data} = message, _) do
    IO.inspect(data, label: "Broadway: handle_message")
    message
    |> Message.update_data(&process_data/1)
  end

  def handle_batch(_, messages, _, _) do
    list = messages |> Enum.map(fn e -> e.data end)
    IO.inspect(list, label: "Got batch")
    messages
  end

  defp process_data(data) do
    {:ok, a} = GenStage.start_link(Imageresizer, %{name: data})   # starting from zero
    {:ok, b} = GenStage.start_link(Imagewatermark, %{})   # expand by 2
    {:ok, c} = GenStage.start_link(Exporter, :ok) # state does not matter

    {:ok, _} = GenStage.sync_subscribe(b, to: a)
    {:ok, _} = GenStage.sync_subscribe(c, to: b)
  end
end
