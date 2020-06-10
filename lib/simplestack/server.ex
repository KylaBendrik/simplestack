defmodule Simplestack.Server do
  use GenServer
  
  def init(init_list) do
    {:ok, init_list}
  end
  
  def handle_call(:pop, _from, [ first | rest ]) do
    {:reply, first, rest}
  end
end
