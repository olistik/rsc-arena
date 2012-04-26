require 'active_support'

module Rsc::Arena
  class BotCollection

    include Enumerable

    BOTS_PATH = File.join File.dirname(__FILE__), '../../players'

    MODULE_CONTAINER = Rsc::Arena::Players

    attr_reader :items

    def initialize
      @bots = []
    end

    def load!
      bots_names.each do |bot_name|
        load_bot bot_name
      end
    end

    def each
      @bots.each { |bot| yield bot }
    end

    def to_s
      @bots.to_s
    end

    def shuffle!
      @bots.shuffle!
    end

    private
    def bots_names
      Dir["#{BOTS_PATH}/*.rb"].map do |bot_path|
        File.basename(bot_path, '.rb')
      end
    end

    def load_bot(bot_name)
      require "#{BOTS_PATH}/#{bot_name}"
      bot_class_name = ActiveSupport::Inflector.classify(bot_name)
      bot_klass = MODULE_CONTAINER.const_get(bot_class_name)
      @bots << Bot.new(bot_name, bot_klass)
    end

  end
end
