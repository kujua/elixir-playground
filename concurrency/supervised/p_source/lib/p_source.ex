defmodule PSource do
  @moduledoc false

  def send_to_echo do
    PSourceWorker.echo "1: Hello"
    PSourceWorker.echo "1: World"
    PSourceWorker.echo "2: Hello"
    PSourceWorker.echo "2: World"
  end
end
