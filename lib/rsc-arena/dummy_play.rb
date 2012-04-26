module Rsc::Arena::Players
  module DummyPlay

    def see_opponent_card(opponent, card)
      puts "#{opponent} has #{card.value}"
    end

    def ask_for_bet(turn_actions)
      (rand * 10).to_i
    end

    def notify_ante_payed(amount)
      puts "I've payed #{amount}"
    end
  end
end
