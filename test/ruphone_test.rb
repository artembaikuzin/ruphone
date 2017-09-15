require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/ruphone'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RuphoneTest < MiniTest::Test
  def test_normalize
    cases = [['', {}, '',], ['  e w a', {}, ''],
             ['1 2 3 4 (5) 5-7', { city_code: '7343' }, '+73431234557'],
             ['921-746-95-48', {}, '+79217469548'],
             ['89217469548', {},  '+79217469548'],
             ['7(921)746-95-48', {}, '+79217469548'],
             ['217469548', { city_code: '4444' }, '217469548'],
             ['22-22-22', { city_code: '+71234' }, '+71234222222']]

    cases.each { |c| assert_equal(c[2], Ruphone.normalize(c[0], c[1])) }
    assert_nil(Ruphone.normalize(nil))
  end
end
