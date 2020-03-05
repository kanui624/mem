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

  describe 

end
