module TransactionsHelper
  def number_to_euros(number)
    number_to_currency(number, unit: "€", separator: ".", delimiter: " ", format: "%n %u")
  end
end
