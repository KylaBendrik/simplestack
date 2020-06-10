defmodule Simplestack.Server do
  use GenServer
  # External API
  def start_link(init_list) do
    GenServer.start_link(__MODULE__, init_list, name: __MODULE__)
  end
  
  def pop do
    GenServer.call __MODULE__, :pop
  end
  
  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end
  
  # GenServer Implementation
  def init(init_list) do
    {:ok, init_list}
  end
  
  def handle_call(:pop, _from, []) do
    IO.puts "Stack has been over-popped. Quiting now! Toodles, y'all..."
    terminate(:bad_pop, [])
  end
  
  def handle_call(:pop, _from, [ first | rest ]) do
    {:reply, first, rest}
  end
  
  def handle_cast({:push, value}, current_list) do
    {:noreply, [value | current_list]}
  end
  
  def terminate(:bad_pop, _state) do
    System.halt
  end
end
