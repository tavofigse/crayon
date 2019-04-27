defmodule Crayon do
  @moduledoc """
  Terminal string styling done right
  """
  @colors [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white,
           :light_black, :light_red, :light_green, :light_yellow, :light_blue,
           :light_magenta, :light_cyan, :light_white]

  @modifiers [:reset, :bright, :italic, :underline, :inverse, :framed]

  defp sequence(escapes, string) do
      escapes ++ [string, :reset]
      |> IO.ANSI.format_fragment(true)
  end

  @colors
  |> Enum.each(fn (color) ->
    def unquote(color)(string, opts \\ []) do
      sequence([unquote(color)] ++ opts, string)
    end
  end)

  @modifiers
  |> Enum.each(fn (modifier) ->
    def unquote(modifier)(string, opts \\ []) do
      sequence([unquote(modifier)] ++ opts, string)
    end
  end)
end