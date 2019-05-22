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

  def handle_message(processor, message, context) do
    IO.inspect(processor, label: "Broadway - handle_message - processor")
    IO.inspect(message.data, label: "Broadway - handle_message - data")
    IO.inspect(context, label: "Broadway - handle_message - context")

    updatedmessage = Transformer.transform_queue_message_to_model(message.data, [])
    |> Message.update_data(&process_data/1)

    IO.inspect(updatedmessage.data.status, label: "Broadway - handle_message - status")

    case updatedmessage.data.status do
      :ok -> updatedmessage
      _ -> Message.failed(updatedmessage, "image processing failed")
    end
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
