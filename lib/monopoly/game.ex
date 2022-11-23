defmodule Monopoly.Game do
  alias __MODULE__

  defstruct [:players, rounds: []]

  @min_players 2
  @max_players 8
  @game_rounds 20

  def new(players) do
    shuffled_players = Enum.shuffle(players)
    %Game{players: shuffled_players}
  end

  def play(%Game{players: players}) when length(players) not in @min_players..@max_players,
    do: raise("Must have between 2-8 players")

  def play(%Game{players: players}) do
    rounds = Enum.map(1..@game_rounds, fn _ -> players end)
    %Game{players: players, rounds: rounds}
  end
end
