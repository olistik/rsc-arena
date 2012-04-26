module Rsc::Arena
  class Card
    attr_reader :value, :seed
    def initialize(value, seed)
      @value, @seed = value, seed
    end
  end
end
