require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
      @user = User.create!(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@test.com", password: "test_password12!")
  end

  describe "create" do 
    it "should create 1 user" do 
      expect(User.all.count).to eq(1)
    end
  end
end