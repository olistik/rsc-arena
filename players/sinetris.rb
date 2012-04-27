module Rsc::Arena::Players
  class Sinetris
    attr_accessor :chips

    def initialize
      @cards = []
      @round = 0
    end

    def see_opponent_card(opponent, card)
      @cards[@round] = [] unless @cards[@round]
      @cards[@round] << card
    end

    def ask_for_bet(turn_actions)
      bet = 0
      # max_bet = turn_actions.max { |turn_a, turn_b| turn_a[1].to_i <=> turn_b[1].to_i}
      # unless @cards[@round].nil?
      #   max = @cards[@round].max { |a, b| a.value.to_i <=> b.value.to_i }.value.to_i
      #   bet = (@chips * 0.5).floor if max < 6
      # end
      # bet = max_bet[1] if max_bet && bet < max_bet[1]
      # bet = nil if bet > @chips
      @round += 1
      return bet
    end

    def notify_ante_payed(amount)
      puts "Sinetris payed #{amount}"
    end
  end
end
