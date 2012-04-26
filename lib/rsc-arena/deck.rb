module Rsc::Arena
  class Deck
    attr_reader :cards

    SEEDS = [:clubs, :diamonds, :hearts, :spades]
    VALUES = (1..10).to_a.map(&:to_s) #+ %w[J Q K]

    def initialize
      @cards = SEEDS.map do |seed|
        VALUES.map do |value|
          Card.new(value, seed)
        end
      end
      @cards.flatten!
      @cards.shuffle!
    end

    def pop
      @cards.pop
    end
  end
end
