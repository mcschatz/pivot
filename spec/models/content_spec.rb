require 'rails_helper'

describe "content" do
  it "has a name" do
    content = Content.new(name: nil, payload: "not nil")
    expect(content).to_not be_valid
  end

  it "has a unique name" do
    Content.create(name: "bob", payload: "anything")
    duplicate = Content.new(name: "bob", payload: "something else")
    expect(duplicate).to_not be_valid
  end
end