require 'pry'
require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class TestCustomer < Minitest::Test

  def setup
    @cust1 = Customer.new("Jennifer", 21, 0, 0.0)
    @cust2 = Customer.new("Tom", 33, 3, 50.00)
    @cust3 = Customer.new("Louise", 32, 9, 30.00)
    @cust4 = Customer.new("Arun", 24, 12, 20.00)

    @bud = Drink.new("beer",4.50, 1)
    @highland_park =  Drink.new("whisky", 6.00, 3)

    @pub2 = Pub.new("Milnes", 200.50, [@bud, @highland_park])
  end

  def test_customer_name
    assert_equal("Jennifer", @cust1.name)
  end

  def test_customer_age
    assert_equal(21, @cust1.age)
  end

  def test_customer_wallet__empty
    assert_equal(0.0, @cust1.wallet)
  end

  def test_customer_wallet__value
    assert_equal(50.00, @cust2.wallet)
  end

  def test_customer_buy_drink
    #binding.pry
    @cust2.buy_drink(@pub2, @highland_park)
    assert_equal(44.00, @cust2.wallet)
  end

  def test_increase_customer_drunkness_level
    #binding.pry
    @cust2.buy_drink(@pub2, @highland_park)
    assert_equal(6, @cust2.drunkness_level)
  end

  def test_do_not_serve
    level = @cust4.drunkness_level
    assert_equal(true, @cust4.do_not_serve)
  end

end
