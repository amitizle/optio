require 'optio/exceptions'

module Optio
  class ShortSwitchRegistry
    attr_reader :registered
    attr_reader :pool

    def initialize
      @registered = {}
      @pool = ('a'..'z').to_a
    end

    def register(switch_name, short_name)
      if !@pool.include?(short_name)
        raise Exceptions::ShortSwitchAlreadyExistsError,
          "#{short_name} already registered with #{switch_name}"
      end
      @pool.delete(short_name)
      @registered[switch_name] = short_name
    end

    def get(switch_name)
      switch_list = switch_name.to_s.chars.to_a.uniq
      chosen_switch = switch_list.find do |short_switch|
        @pool.include?(short_switch)
      end
      if !chosen_switch
        chosen_switch = random_short_switch
      end
      @pool.delete(chosen_switch)
      @registered[switch_name] = chosen_switch
      chosen_switch
    end

    private

    def random_short_switch
      @pool.shuffle.first
    end
  end
end
