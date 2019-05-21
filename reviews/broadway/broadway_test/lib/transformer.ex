defmodule Transformer do
  @moduledoc false

  alias Broadway.Message
  
  def transform_queue_message_to_model(message, _opts) do
    IO.inspect(message, label: "transform_queue_message_to_model")
    model = %ImageProcessingModel{customer_id: "S3R556", file_name: "warthog.jpg", image_type: "jpg"}
    validate_model(model)
    %Message{
      data: model,
      acknowledger: {__MODULE__, :ack_id, :ack_data}
    }
  end

  defp validate_model(model) do
    IO.inspect(model, label: "validate_model")
    model
  end
end
