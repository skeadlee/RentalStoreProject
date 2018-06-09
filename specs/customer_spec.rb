require("minitest/autorun")
require("minitest/rg")

require_relative("../models/customer")

class TestCustomer < MiniTest::Test

  def setup
    options = {
      "first_name" => "Bobby",
      "last_name" => "Newport",
      "email" => "bnewport@sweetums.com",
      "tel_number" => "+447777777778"
    }
    @customer = Customer.new(options)
  end

  def test_customer_has_email()
    assert_equal("bnewport@sweetums.com", @customer.email )
  end

  def test_customer_update_phone_number()
    @customer.tel_number = "447777777772" #give cust new telephone number
    @customer.update() #update telephone number in db
    # updated_customer = Customer.find_by_email("bnewport@sweetums.com") #find customer in db (using email as id can change)
    # assert_equal("447777777772", updated_customer.tel_number)
  end



end
