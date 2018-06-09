require("minitest/autorun")
require("minitest/rg")

require_relative("../models/customer")
require_relative("../models/stock")

class TestCustomer < MiniTest::Test

  def test_find_cust_by_email
    customer = Customer.find_by_email("bnewport@sweetums.com")
    assert_equal("Bobby Newport", customer.full_name())
  end

  def test_stock_has_been_rented
    customer = Customer.find_by_email("bnewport@sweetums.com")
    tuxedo = Stock.find(2)
    tuxedo.rent_to_customer(customer.id)
    cust_rentals = customer.rentals()
    assert_equal(1, cust_rentals.count)
  end


end
