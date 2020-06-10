defmodule SimplestackTest do
  use ExUnit.Case
  doctest Simplestack

  test "greets the world" do
    assert Simplestack.hello() == :world
  end
end
