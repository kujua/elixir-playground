defmodule ImageProcessingModel do
  @moduledoc false

  @enforce_keys [:customer_id, :file_name, :image_type, :status]
  defstruct customer_id: nil,
            file_name: nil,
            image_type: nil,
            path_from: nil,
            path_to: nil,
            destination_type: nil,
            status: :ok
end
