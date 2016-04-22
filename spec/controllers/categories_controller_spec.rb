require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "categories#new action" do
    it "should only allow admins to access category creation" do
      get :new
      expect(response).to redirect_to root_path
    end

    it "should successfully show the new form" do
      user = FactoryGirl.create(:user, admin: true)
      sign_in user
      assert user.admin?
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "categories#create action" do
    it "should only allow admins to create categories" do
      post :create, category: {name: "News", description: "A place for news"}
      expect(response).to redirect_to root_path
    end

    it "should successfully create a category in the database" do
      user = FactoryGirl.create(:user, admin: true)
      sign_in user
      assert user.admin?
      
      post :create, category: {name: 'News', description: "A place for news"}
      expect(response).to redirect_to root_path

      category = Category.last
      expect(category.name).to eq("News")
      expect(category.description).to eq("A place for news")
    end

    it "should not allow a blank name" do
      user = FactoryGirl.create(:user, admin: true)
      sign_in user
      assert user.admin?

      category_pre_count = Category.count
      post :create, category: {name: '', description: "A place for news"}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(category_pre_count).to eq Category.count
    end
  end
end
