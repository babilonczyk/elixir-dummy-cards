defmodule CardsTest do
  import Mock
  use ExUnit.Case

  doctest Cards

  describe "create_deck/0" do
    test "creates a deck of cards" do
      deck = Cards.create_deck
      first_card = List.first(deck)
      last_card =  List.last(deck)

      assert first_card == "A of Spades"
      assert last_card == "K of Diamonds"
    end
  end

  describe "shuffle/1" do
    test "shuffles a deck of cards" do
      deck = ["A of Spades", "2 of Spades", "3 of Spades"]
      assert Cards.shuffle(deck) != deck
    end
  end
end
