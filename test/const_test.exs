defmodule ConstTest do
  use ExUnit.Case
  doctest Const

  test "greets the world" do
    assert Const.hello() == :world
  end
end
