module Rsc::Arena::Players
  # michele@sportboom.it
  # sergio.berisso@gmail.com
  # davide.rambaldi@gmail.com
  class Tucano    
    
    def initialize
      @max_card = 0
      @i = 0
    end
    
    attr_accessor :chips
    
    def see_opponent_card(opponent, card)
      #puts "I have #{@chips} chips"
      #puts "#{card.value.class} , #{@max_card.class}"
      if (card.value.to_i > @max_card) then @max_card = card.value.to_i end
      #puts "my opponent #{opponent}, have card #{card.value}"
    end
    
    def ask_for_bet(turn_actions)
      # strategia di betting
      #puts "card max: #{@max_card}"
      
      if (@i == 0) then 
        bet = 0
      else        
        case @max_card
          when 1 then bet = @chips
          when 10 then bet = 0          
          else bet = 10 - @max_card            
        end
      end
            
      @max_card = 0
      @i = @i + 1
      return bet
    end
    
  end
end
