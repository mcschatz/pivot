require 'rails_helper'

describe 'order' do
  let(:status){
     ["Ordered", "Paid", "Cancelled", "Completed"]
  }
  it "can have only certain status" do
    user = User.new
    order = Order.new(user: user)
    status.each do |status|
      order.status = status
      expect(order).to be_valid
    end
    order.status = "paid"
    expect(order).to_not be_valid
  end

end
