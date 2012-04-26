module Rsc::Arena::Players
  class Aaaron
    # include DummyPlay
    attr_accessor :chips
    
    def initialize
      @card = {}
    end
    
    def ask_for_bet(turn_actions)
      max_bet = turn_actions.max { |turn| turn[1].to_i }
      value = (@chips * 0.01).floor
      
      min, max = @card.values.partition{|e| e.value.to_i < 6 }
      max_opponent = @card.values.max{|e| e.value.to_i }.value.to_i
      if max_opponent > 7
        0
      else
        if (min.size > max.size)
          (10 - max_opponent.to_i) * value
        else 
          0
        end
      end
    end
    
    def notify_ante_payed(amount)
      @card = {}
    end
    
    def see_opponent_card(opponent, card)
      @card[opponent] = card
    end
  end
end
