require 'rails_helper'

RSpec.describe MemsController, type: :controller do

  describe "mems#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "mems#new action" do 
    it "should successfully show the add memory form" do
      get :new
      expect(response).to have_http_status(:success)
    end 
  end 

  describe "mems#create action" do
    it "should successfully create a memory on the database" do

      post :create, params: { memory: { title: 'test_memory' } }
      expect(response).to redirect_to root_path

      memory = Memory.last
      expect(memory.title).to eq("test_memory")
    end 

    it "should properly deal with validation errors" do 
      post :create, params: { memory: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Memory.count).to eq 0
    end
  end 

end
