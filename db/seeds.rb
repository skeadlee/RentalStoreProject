require_relative('../models/customer')
require_relative('../models/stock')

Customer.delete_all()
Stock.delete_all()

customer1 = Customer.new({
  "first_name" => "Bobby",
  "last_name" => "Newport",
  "email" => "bnewport@sweetums.com",
  "tel_number" => "+447777777778"
})

customer2 = Customer.new({
  "first_name" => "Jerry",
  "last_name" => "Gergich",
  "email" => "garygergich@parksdept.com",
  "tel_number" => "+447878787878"
})

customer3 = Customer.new({
  "first_name" => "Mark",
  "last_name" => "Brendanawicz",
  "email" => "mark_b@planningdept.com",
  "tel_number" => "+447898989787"
})

customer4 = Customer.new({
  "first_name" => "Craig",
  "last_name" => "Middlebrooks",
  "email" => "craigm@eagleton.com",
  "tel_number" => "+447890987789"
})

customer1.save()
customer2.save()
customer3.save()
customer4.save()

stock_item1 = Stock.new({
  "type" => "Tuxedo",
  "colour" => "Claret",
  "price" => 60
})

stock_item2 = Stock.new({
  "type" => "Tuxedo",
  "colour" => "Peacock",
  "price" => 70
})

stock_item3 = Stock.new({
  "type" => "Lounge Suit",
  "colour" => "Silver",
  "price" => 50
})

stock_item4 = Stock.new({
  "type" => "Lounge Suit",
  "colour" => "Ice Blue",
  "price" => 55
})

stock_item1.save()
stock_item2.save()
stock_item3.save()
stock_item4.save()
