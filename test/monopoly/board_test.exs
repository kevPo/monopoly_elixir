defmodule Monopoly.BoardTest do
  use ExUnit.Case, async: true

  alias Monopoly.Board

  test "player on 0 rolls 7 and ends up on 7" do
    assert Board.move({"player", 0}, 7) == {"player", 7}
  end

  test "player on 39 rolls 6 ends up on 5" do
    assert Board.move({"player", 39}, 6) == {"player", 5}
  end
end
