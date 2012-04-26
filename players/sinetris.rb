module Rsc::Arena::Players
  class Sinetris
    def see_opponent_card(opponent, card)
      puts "#{opponent} has #{card.value}"
    end

    def ask_for_bet(turn_actions)
      0
    end

    def notify_ante_payed(amount)
      puts "I've payed #{amount}"
    end
    attr_accessor :chips
  end
end
