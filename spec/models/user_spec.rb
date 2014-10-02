require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "should create a new instance of a user given valid attributes" do
    create(:user, email: 'test@gmail.com').should be_valid
  end

  it "should validate password confirmation" do
    build(:user, password_confirmation: '2582').should_not be_valid
  end

  it "should validate duplicate email" do
    create(:user, email: "adele@gmail.com")
    build(:user, email: "adele@gmail.com").should_not be_valid
  end

  it "should validate presence of email" do
    build(:user, email: nil).should_not be_valid
  end

  it "should validate presence of password" do
    build(:user, password: nil).should_not be_valid
  end
end
