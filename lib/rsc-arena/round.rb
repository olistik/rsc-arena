module Rsc::Arena
  class Round

    ANTE = 10

    def initialize(bots)
      @bots = bots
    end

    def play!
      puts "Chips:" + @bots.map {|bot| [bot.name, bot.chips] }.inspect
      @deck = Deck.new
      phase(:ante)
      puts "Ante:" + @bots.map {|bot| [bot.name, bot.bet] }.inspect
      phase(:give_card)
      puts "Cards:" + @bots.map {|bot| [bot.name, bot.card.value] }.inspect
      phase(:show_opponents_card)
      @previous_choices = []
      @higher_card = nil
      @winners = []
      phase(:bet)
      puts "Total Bet:" + @bots.map {|bot| [bot.name, bot.bet] }.inspect
      phase(:resolve)
      puts "Winners: " + winners.map {|winner| winner.name}.inspect
      puts "Chips: " + @bots.map {|bot| [bot.name, bot.chips]}.inspect
    end

    private

    def pot
      @bots.map(&:bet).inject(&:+)
    end

    def winners
      @bots.select { |bot| bot.card.value == higher_card }
    end

    def higher_card
      @higher_card ||= @bots.max { |a, b| a.card.value <=> b.card.value }.card.value
    end

    def phase(name)
      @bots.each { |bot| send("phase_#{name}", bot) }
    end

    # phases
    def phase_ante(bot)
      bot.bet = bot.chips >= ante ? ante : bot.chips
      bot.notify_ante_payed(bot.bet)
    end

    def phase_give_card(bot)
      bot.card = @deck.pop
    end

    def phase_show_opponents_card(bot)
      opponents(bot).each { |opponent| bot.see_opponent_card(opponent) }
    end

    def phase_bet(bot)
      bet = bot.ask_for_bet(@previous_choices)
      puts "\t* #{bot.name} adds #{bet}"
      @previous_choices << [bot.name, bet]
      bot.bet += bet
    end

    def opponents(bot)
      @bots.select { |opponent| opponent.name != bot.name }
    end

    def phase_resolve(bot)
      bot.chips -= bot.bet
      bot.chips += pot / winners.count if winners.include? bot
    end

    def ante
      ANTE
    end
  end
end
