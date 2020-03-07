require 'rails_helper'

RSpec.describe MemsController, type: :controller do

  describe "mems#index action" do
    it "should successfully show the page" do
      user = FactoryBot.create(:user)
      sign_in user
      user.memories.create(mem: "test_mem", mood: "test_mood", thoughts: "test_thought", date: "2020-03-06", location: "test_mem_title")
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should redirect the user to the mem create form if there are no memories in the database" do
      user = FactoryBot.create(:user)
      sign_in user 
      get :index
      expect(response).to redirect_to new_mem_path
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
    it "should successfully create a memory in the database" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { memory: { mem: 'test_mem', mood: 'test_mood', thoughts: 'test_thought', date: '2020-03-06', location: 'test_mem_title'} }
      expect(response).to redirect_to mems_path
      memory = Memory.last
      expect(memory.mem).to eq("test_mem")
      expect(memory.user).to eq(user)
    end 

    it "should properly deal with validation errors" do 
      user = FactoryBot.create(:user)
      sign_in user
      memory_count = Memory.count
      post :create, params: { memory: { mem: '', mood: '', thoughts: '', location: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(memory_count).to eq Memory.count
    end
  end

  describe "mems#show action" do
    it "should successfully show the page if the memory is found" do
      user = FactoryBot.create(:user)
      sign_in user
      memory = user.memories.create(mem: "test_mem", mood: "test_mood", thoughts: "test_thought", date: "2020-03-06", location: "test_mem_title")
      get :show, params: { id: memory.id }
      expect(response).to have_http_status(:success)
    end

    it "should redirect to mems_path if the memory is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: 'test_url' }
      expect(response).to redirect_to mems_path
    end
  end 
end
