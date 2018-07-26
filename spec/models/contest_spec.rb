require 'rails_helper'

describe Contest do
  describe "validations" do
    it "requires status to be in the available set" do
      contest = create(:contest)
      expect(contest).to be_valid
      contest.status = "not valid status"
      expect(contest).not_to be_valid
    end
  end
end
