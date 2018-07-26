require 'rails_helper'

describe ContestsController do
  describe "#show" do
    it "returns the JSON format of a contest" do
      contest = create(:contest)
      get :show, params: { id: contest }
      expect(response).to be_success
    end
  end
end
