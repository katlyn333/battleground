require 'rails_helper'

describe Contest do
  describe "validations" do
    let(:contest) { build(:contest) }

    before do
      expect(contest).to be_valid
    end

    it "requires status to be in the available set" do
      contest.status = "not valid status"
      expect(contest).not_to be_valid
    end

    it "requires participant_1" do
      contest.participant_1 = nil
      expect(contest).not_to be_valid
    end

    it "requires participant_2" do
      contest.participant_1 = nil
      expect(contest).not_to be_valid
    end

    it "requires the winner to be one of the participants" do
      contest.winner = "not a participant"
      expect(contest).not_to be_valid

      contest.winner = contest.participant_1
      expect(contest).to be_valid
    end
  end
end
