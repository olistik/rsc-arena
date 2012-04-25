require_relative '../spec_helper'

module Rsc::Arena
  describe Game do

    describe '#bots' do
      it 'should return a collection' do
        Game.new.bots.should respond_to(:count)
      end

      context 'when the no bot has been added yet' do
        it 'should be empty' do
          Game.new.bots.count.should be(0)
        end
      end

      it 'should allow the addition of a bot' do
        game = Game.new
        -> { game.bots << Object.new }.should change(game.bots, :count).by(1)
      end

    end
  end
end
