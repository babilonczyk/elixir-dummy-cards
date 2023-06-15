defmodule Cards do
  @moduledoc """
  This module provides methods for creating and manipulating decks of cards.
  """

  @doc """
    Creates a deck of cards.
    Returns a list of strings representing the cards in the deck.

  ## Examples
    iex> Cards.create_deck
  """
  def create_deck do
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a deck of cards.
    Returns a shuffled list of strings representing the cards in the deck.

  ## Examples
    iex> Cards.shuffle(["A of Spades", "2 of Spades", "3 of Spades"])
  """
  def shuffle(deck) do
    deck
    |> Enum.shuffle
  end

  @doc """
    Checks if a deck of cards contains a given card.
    Returns true if the deck contains the card, false otherwise.

  ## Examples
    iex> Cards.contains?(["A of Spades", "2 of Spades"], "A of Spades")
    true
    iex> Cards.contains?(["A of Spades", "2 of Spades"], "3 of Spades")
    false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand of cards from a deck.
    Returns a tuple containing the hand and the remaining deck.

  ## Examples
    iex> Cards.deal(["A of Spades", "2 of Spades", "3 of Spades"], 2)
    {["A of Spades", "2 of Spades"], ["3 of Spades"]}
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a deck of cards to a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from a file.
    Returns a list of strings representing the cards in the deck.

  ## Example
    iex> Cards.load("deck")
  """
  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "File does not exist"
    end
  end

  @doc """
    Creates a hand of cards from a deck. Shuffles them and deals the hand.
    It takes hand size as a parameter.
    Returns a tuple containing the hand and the remaining deck.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
