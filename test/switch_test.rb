require 'test_helper'

class SwitchTest < Minitest::Test
  def test_params_array_basic_should_return_an_array_with_all_opts
    switch_opts = {
      type: TrueClass,
      short: 't',
      desc: 'test switch'
    }
    switch = Optio::Switch.new(:test, switch_opts)
    assert_equal(
      ['-t TEST', '--test TEST', TrueClass, 'test switch'],
      switch.rb_parser_args
    )
  end
end
