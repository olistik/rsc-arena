module Rsc::Arena::Players
  module DummyPlay

    def see_opponent_card(opponent, card)
    end

    def ask_for_bet(turn_actions)
      (rand * 10).to_i
    end
  end
end
