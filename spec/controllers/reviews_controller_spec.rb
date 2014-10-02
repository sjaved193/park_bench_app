require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do

  let(:valid_attributes) { }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  login_user

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
