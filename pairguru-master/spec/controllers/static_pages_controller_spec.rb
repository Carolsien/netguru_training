require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #topcommenters" do
    it "returns http success" do
      get :topcommenters
      expect(response).to have_http_status(:success)
    end
  end

end
