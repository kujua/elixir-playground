defmodule Transformer do
  @moduledoc false

#  use GenStage
  alias Broadway.Message
  
  def transform_queue_message_to_model(message, _opts) do
    IO.inspect(message, label: "transform_queue_message_to_model")
    model = create_model(message)
    validate_model(model)
    %Message{
      data: model,
      acknowledger: {__MODULE__, :ack_id, :ack_data}
    }
  end

  def transform_model_to_message(model, _opts) do
    IO.inspect(model, label: "transform_model_to_message")
    %Message{
      data: model,
      acknowledger: {__MODULE__, :ack_id, :ack_data}
    }
  end

  defp validate_model(model) do
    IO.inspect(model, label: "validate_model")
  end

  defp create_model(message) do
    %ImageProcessingModel{
      customer_id: Enum.at(String.split(message, ","), 0),
      file_name: Enum.at(String.split(message, ","), 1),
      image_type: Enum.at(String.split(message, ","), 2),
      path_from: Enum.at(String.split(message, ","), 3),
      path_to: Enum.at(String.split(message, ","), 4),
      destination_type: Enum.at(String.split(message, ","), 5),
      status: :ok
    }
  end

  def ack(ack_ref, successful, failed) do
    IO.inspect(ack_ref, label: "ack - ack_ref")
    IO.inspect(successful, label: "ack - successful")
    IO.inspect(failed, label: "ack - failed")
  end
end
