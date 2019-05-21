defmodule ImageProcessingModel do
  @moduledoc false

  @enforce_keys [:customer_id, :file_name, :image_type]
  defstruct customer_id: nil,
            file_name: nil,
            path_from: nil,
            path_to: nil,
            image_type: nil,
            destination_type: nil,
            status: :ok
end
