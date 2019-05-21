defmodule BroadwayTest do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: RabbitBroadway,
      context: %{},
      producers: [
        default: [
          module: {BroadwayRabbitMQ.Producer,
            queue: "images",
            qos: [
              prefetch_count: 50,
            ]
          },
          stages: 2
#          transformer: {__MODULE__, :transform_queue_message, []}
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

  def handle_message(processor, %Message{data: data} = message, context) do
    IO.inspect(processor, label: "Broadway - handle_message - processor")
    IO.inspect(data, label: "Broadway - handle_message - data")
    IO.inspect(context, label: "Broadway - handle_message - context")
    Transformer.transform_queue_message_to_model(data, [])
    |> Message.update_data(&process_data/1)
  end

#  def handle_batch(_, messages, _, _) do
#    list = messages |> Enum.map(fn e -> e.data end)
#    IO.inspect(list, label: "Got batch")
#    messages
#  end

  defp process_data(data) do
    IO.inspect(data, label: "Broadway - process data")
    Imageresizer.process(data)
  end

#  def transform_queue_message_to_model(message, _opts) do
#    IO.inspect(message, label: "transform_queue_message")
#    %Message{
#      data: message,
#      acknowledger: {__MODULE__, :ack_id, :ack_data}
#    }
#  end
end
