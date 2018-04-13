defmodule RipperTest do
  use ExUnit.Case
  doctest Ripper

  test "greets the world" do
    assert Ripper.hello() == :world
  end
end
