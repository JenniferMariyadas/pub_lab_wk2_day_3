require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class TestPub < Minitest::Test

  def setup
    @bud = Drink.new("beer",4.50)
    @highland_park =  Drink.new("whiskey", 6.00)
    @pub1 = Pub.new("Standing Order", 0.0, [])
    @pub2 = Pub.new("Milnes", 200.50, [@bud, @highland_park] )
  end

  def test_pub_name
    assert_equal("Standing Order", @pub1.name)
  end

  def test_till__empty
    assert_equal(0.0, @pub1.till)
  end

  def test_till__value
    assert_equal(200.50, @pub2.till)
  end

  def test_drinks__empty
    assert_equal([], @pub1.drinks)
  end

  def test_drinks__populated
    assert_equal([@bud,@highland_park], @pub2.drinks)
  end




end
