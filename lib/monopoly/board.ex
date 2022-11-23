defmodule Monopoly.Board do
  @board_size 40

  def move({player, position}, roll) when position + roll >= @board_size,
    do: {player, position + roll - @board_size}

  def move({player, position}, roll), do: {player, position + roll}
end
