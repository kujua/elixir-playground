defmodule PSource do
  @moduledoc """
  Documentation for PSource.
  """

  @doc """
  Hello world.
  """
  def send_to_echo do
    PEcho.echo_message("Hello")
    PEcho.echo_message("World")
  end
end
