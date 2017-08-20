require 'test_helper'

class ShortSwitchRegistryTest < Minitest::Test
  def test_registering_same_switch_twice_raises_error
    registry = Optio::ShortSwitchRegistry.new
    assert_raises(Optio::Exceptions::ShortSwitchAlreadyExistsError) do
      registry.register(:switch, 's')
      registry.register(:switch, 's')
    end
  end

  def test_getting_random_assigned_short_switch
    registry = Optio::ShortSwitchRegistry.new
    registry.register(:a, 'h')
    registry.register(:b, 'e')
    registry.register(:c, 'l')
    registry.register(:d, 'p')
    22.times do # 22 letters remaining
      refute_includes registry.pool, registry.get('help')
    end
  end
end
