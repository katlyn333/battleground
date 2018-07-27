require 'rails_helper'

describe ContestsController do
  describe "#show" do
    it "returns the JSON format of a contest" do
      contest = create(:contest)
      get :show, params: { id: contest }
      expect(response).to be_successful
    end
  end

  describe "#index" do
    it "returns a list of all contests" do
      contest1 = create(:contest)
      contest2 = create(:contest)
      contest3 = create(:contest)

      get :index
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end
  end

  describe "#create" do
    it "creates a new contest" do
      expect {
        post :create, params: { participant_1: "234287sdf8a", participant_2: "asdfasf93842", type: "ChariotRace" }
      }.to change { Contest.all.count }.by(1)
      expect(response).to be_successful

      json = JSON.parse(response.body)
      expect(json["participant_1"]).to eq("234287sdf8a")
      expect(json["participant_2"]).to eq("asdfasf93842")
      expect(json["status"]).to eq("active")
    end

    context "when sent invalid params" do
      it "renders an validation error" do
        expect {
          post :create, params: { participant_1: "234287sdf8a", type: "ChariotRace"}
        }.to_not change { Contest.all.count }
        expect(response.status).to eq(400)
        expect(response.body).to include("participant_2")
        expect(response.body).to include("can't be blank")
      end

      it "returns a error if the contest type is invalid" do
        expect {
          post :create, params: { participant_1: "234287sdf8a", participant_2: "asdfasf93842", type: "FooBar" }
        }.to_not change { Contest.all.count }
        expect(response.status).to eq(400)
        expect(response.body).to include("Invalid contest type")
      end
    end
  end
end
