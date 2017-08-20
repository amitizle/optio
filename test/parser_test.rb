require 'test_helper'

class ParserTest < Minitest::Test
  def test_basic_params_returns_map_of_parsed_params
    parser = Optio::Parser.new do |p|
      p.switch :test, type: String, desc: 'Text', short: 't'
      p.switch :another, type: String, desc: 'Test 2', short: 'a'
    end
    parsed_params = parser.parse!(['--test', 'test_1', '--another', 'test_2'])
    assert_equal 'test_1', parsed_params[:test]
    assert_equal 'test_2', parsed_params[:another]
    parsed_params_short = parser.parse!(['-t', 'test_1', '-a', 'test_2'])
    assert_equal 'test_1', parsed_params_short[:test]
    assert_equal 'test_2', parsed_params_short[:another]
  end
end
