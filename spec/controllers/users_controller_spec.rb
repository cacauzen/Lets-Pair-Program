require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "users#show action" do

    it "should require users to be logged in to see their profile" do
      get :show, id: 1
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show profile page for correct user" do
      user = FactoryGirl.create(:user)
      sign_in user

      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end
end
