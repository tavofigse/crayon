defmodule Crayon do
  @moduledoc """
  Provides a simple API to change text color and styling
  strings in the terminal.
  """
  alias IO.ANSI

  defp to_ansi(escape) do
    case escape do
      :black -> ANSI.black
      :red -> ANSI.red
      :green -> ANSI.green
      :yellow -> ANSI.yellow
      :blue -> ANSI.blue
      :magenta -> ANSI.magenta
      :cyan -> ANSI.cyan
      :white -> ANSI.white
      :lt_black -> ANSI.light_black
      :lt_red -> ANSI.light_red
      :lt_green -> ANSI.light_green
      :lt_yellow -> ANSI.light_yellow
      :lt_blue -> ANSI.light_blue
      :lt_magenta -> ANSI.light_magenta
      :lt_cyan -> ANSI.light_cyan
      :lt_white -> ANSI.light_white
      :lt_bg_black -> ANSI.light_black_background
      :lt_bg_red -> ANSI.light_red_background
      :lt_bg_green -> ANSI.light_green_background
      :lt_bg_yellow -> ANSI.light_yellow_background
      :lt_bg_blue -> ANSI.light_blue_background
      :lt_bg_magenta -> ANSI.light_magenta_background
      :lt_bg_cyan -> ANSI.light_cyan_background
      :lt_bg_white -> ANSI.light_white_background
      :bg_black -> ANSI.black_background
      :bg_red -> ANSI.red_background
      :bg_green -> ANSI.green_background
      :bg_yellow -> ANSI.yellow_background
      :bg_blue -> ANSI.blue_background
      :bg_magenta -> ANSI.magenta_background
      :bg_cyan -> ANSI.cyan_background
      :bg_white -> ANSI.white_background
      :bold -> ANSI.bright
      :reset -> ANSI.reset
      :italic -> ANSI.italic
      :underline -> ANSI.underline
      :inverse -> ANSI.inverse
      _ -> escape
    end
  end

  def draw(escapes) do
    escapes
    |> Enum.map(fn (escape) -> to_ansi(escape) end)
    |> IO.ANSI.format_fragment
  end

end