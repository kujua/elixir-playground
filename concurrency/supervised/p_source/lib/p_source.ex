defmodule PSource do
  @moduledoc false

  def send_to_echo do
    PSourceWorker.echo "Hello"
    PSourceWorker.echo "World"
  end
end
