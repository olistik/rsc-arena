module Rsc::Arena::Players
  # michele AT sportboom.it
  # sergio.berisso AT gmail.com
  # davide.rambaldi AT gmail.com
  class Tucano    
    
    def initialize
      @max_card = 0
      @opponents = 0
      @i = 0
      @nmax = 0
    end
    
    attr_accessor :chips
    
    def see_opponent_card(opponent, card)
      @opponent += 1
      #puts "I have #{@chips} chips"
      #puts "#{card.value.class} , #{@max_card.class}"
      if (card.value.to_i > @max_card) then 
        @max_card = card.value.to_i 
        @nmax = 1
      elsif (card.value.to_i == @max_card) then
        @nmax += 1
      end
      #puts "my opponent #{opponent}, have card #{card.value}"
    end
    
    def notify_ante_payed(amount)
      puts "I've payed #{amount}"
      @max_card = 0
      @opponent = 0
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
          else bet = (( ((10 - @max_card)*4) + (4 - @nmax)) / (40 - @opponent)) * 10
        end
      end
      
      @i += 1
      return bet
    end
    
  end
end
