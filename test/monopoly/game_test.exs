defmodule Monopoly.GameTest do
  use ExUnit.Case, async: true

  alias Monopoly.Game

  test "new game is created with horse and car" do
    assert %Game{players: players} = Game.new(["horse", "car"])
    assert "horse" in players
    assert "car" in players
  end

  test "play fails when game has one player" do
    game = Game.new(["horse"])

    assert_raise RuntimeError, "Must have between 2-8 players", fn ->
      Game.play(game)
    end
  end

  test "play fails when game has 9 players" do
    players = Enum.map(1..9, fn p -> "player-#{p}" end)
    game = Game.new(players)

    assert_raise RuntimeError, "Must have between 2-8 players", fn ->
      Game.play(game)
    end
  end

  test "within 100 created games with horse and car, both orders appear" do
    games = Enum.map(1..100, fn _ -> Game.new(["horse", "car"]) end)

    assert Enum.any?(games, fn %Game{players: players} -> players == ["horse", "car"] end)
    assert Enum.any?(games, fn %Game{players: players} -> players == ["car", "horse"] end)
  end

  test "play/1 plays 20 rounds for each player" do
    %Game{rounds: rounds, players: players} =
      ["horse", "car"]
      |> Game.new()
      |> Game.play()

    assert length(rounds) == 20
    assert Enum.all?(rounds, fn round -> round == players end)
  end
end
