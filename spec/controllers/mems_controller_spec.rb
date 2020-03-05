require 'rails_helper'

RSpec.describe MemsController, type: :controller do

  describe "mems#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "mems#new action" do 
    it "should require users to be signed in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end 

    it "should successfully show the add memory form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end 
  end 

  describe "mems#create action" do
    it "should successfully create a memory on the database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { memory: { title: 'test_memory' } }
      expect(response).to redirect_to root_path

      memory = Memory.last
      expect(memory.title).to eq("test_memory")
      expect(memory.user).to eq(user)
    end 

    it "should properly deal with validation errors" do 
      user = FactoryBot.create(:user)
      sign_in user

      memory_count = Memory.count
      post :create, params: { memory: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(memory_count).to eq Memory.count
    end
  end 

end
