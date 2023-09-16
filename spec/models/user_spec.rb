# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    user = User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.create(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "can have many groups" do
    user = User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    group1 = Group.create(name: "Group 1")
    group2 = Group.create(name: "Group 2")

    user.groups << group1
    user.groups << group2

    expect(user.groups.count).to eq(2)
  end

  it "can have many groups" do
    user = User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    group1 = Group.create(name: "Group 1")
    group2 = Group.create(name: "Group 2")

    user.groups << group1
    user.groups << group2

    expect(user.groups.count).to eq(2)
  end
end
