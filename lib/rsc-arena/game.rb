module Rsc::Arena
  class Game

    STARTING_CHIPS = 30

    def initialize
      @bots = BotCollection.new
      @bots.load!
      raise "C'mon, only 1 player?!" if @bots.count < 2
      @rounds_counter = 0
    end

    def start
      @bots.shuffle!
      @bots.each { |bot| bot.chips = STARTING_CHIPS }
      until has_winner?
        puts self
        play_round
      end
      puts "And the winner is: #{winner}"
    end

    # private

    def to_s
      "\nRound: #{@rounds_counter}"
    end

    def active_bots_status
      active_bots.to_a.reverse
    end

    def has_winner?
      active_bots.count == 1
    end

    def play_round
      round = Round.new(active_bots)
      round.play!
      @rounds_counter += 1
    end

    def active_bots
      @bots.select(&:active?)
    end

    def winner
      @bots.max
    end
  end
end
