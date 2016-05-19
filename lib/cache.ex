defmodule Cache do
  use GenServer

  @name CGS

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CGS])
  end

  def write(key, value) do
    GenServer.call(@name, {key, value})
  end

  def read(key) do
    GenServer.call(@name, key)
  end

  def delete(key) do
  end

  def clear do
  end

  def exists?(key) do
  end

  # Server Callbacks
  def handle_call({key, value}, _from, state) do
    {:reply, {key, value}, state}
  end

  def handle_call(key, _from, state) do
    {:reply, key, state}
  end

  # Helper Function
end
