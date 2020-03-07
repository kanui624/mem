require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "static_pages#index action" do 
    it "should show the MemBook intro page" do
      get :initial 
      expect(response).to have_http_status(:success)
    end 
  end 

  describe "static_pages#info_page action" do 
    it "should show the MemBook info/home page" do
      get :info_page
      expect(response).to have_http_status(:success)
    end 
  end 

end
