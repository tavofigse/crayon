defmodule CrayonTest do
  use ExUnit.Case
  doctest Crayon

  test "Test the green background with white color and bold strings" do
    assert Crayon.draw([:bg_green, :white, :bold, "Hello, World! "]) == [[[[[], "\e[42m"], "\e[37m"], "\e[1m"], "Hello, World! "]
  end

  test "Test the simple red strings" do
    assert Crayon.draw([:red, "Hello, World! "]) == [[[], "\e[31m"], "Hello, World! "]
  end

  test "Test the complex composition" do
    assert Crayon.draw([
      :green,
      "I am a green line ",
      :blue,
      :underline,
      :bold,
      "With a blue substring",
      :green,
      " that become green again!"
    ]) == [
        [
          [
            [[[[[[], "\e[32m"], "I am a green line "], "\e[34m"], "\e[4m"], "\e[1m"],
            "With a blue substring"
          ],
          "\e[32m"
        ],
        " that become green again!"
      ]
  end
end