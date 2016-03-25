require 'rails_helper'

RSpec.describe SectionsController, type: :controller do
  it "should display a section to a user" do
    section = Section.create
    get :index
    expect(response).to have_http_status(:success)
  end
end
