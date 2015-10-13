module ApplicationHelper
  def dollar_string(cents)
    dollars = (cents.to_f / 100)
    number_to_currency(dollars)
  end
end
