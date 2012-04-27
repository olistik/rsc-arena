module Rsc::Arena::Players
  class ZzzRotacismo
    attr_accessor :chips

    def see_opponent_card(opponent, card)
    end

    def ask_for_bet(turn_actions)
      0
    end

    def notify_ante_payed(amount)
      puts "I've payed #{amount}"
    end

    # class Rsc::Arena::Game
    #   def start
    #     @bots.shuffle!
    #     @bots.each { |bot| bot.chips = STARTING_CHIPS }
    #     until has_winner?
    #       puts self
    #       play_round
    #     end
    #     #puts "And the winner is: #{winner}"
    #     puts "E' inutile che perdi la testa, sono troppo forte. --Giovanni"
    #   end

    #   def winner
    #     return Rsc::Arena::Players::Rotacismo.new
    #   end
    # end
  end
end
