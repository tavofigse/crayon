defmodule CrayonTest do
  use ExUnit.Case
  doctest Crayon

  test "greets the world" do
    assert Crayon.hello() == :world
  end
end
