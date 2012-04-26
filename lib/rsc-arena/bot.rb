module Rsc::Arena
  class Bot
    attr_accessor :chips, :card, :bet
    attr_reader :name

    include Comparable

    def initialize(name, klass)
      @name, @bot = name, klass.new
      @card = nil
      @bet = 0
      @chips = 0
    end

    def chips=(amount)
      @chips = amount
      @bot.chips = amount
    end

    def active?
      @chips > 0
    end

    def <=>(other)
      @chips <=> other.chips
    end

    def to_s
      "#{@name} -> #{@chips}"
    end

    def see_opponent_card(opponent)
      @bot.see_opponent_card(opponent.name, opponent.card)
    end

    def method_missing(name, *args, &block)
      @bot.send(name, *args, &block)
    end
  end
end

