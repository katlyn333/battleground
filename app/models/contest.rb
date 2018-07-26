class Contest < ActiveRecord::Base
  AVAILABLE_STATUSES = ["active", "finished"]

  after_initialize :set_default_status

  validates :status, :inclusion=> { :in => AVAILABLE_STATUSES }
  validates :participant_1, :participant_2, presence: true
  validate :winner_is_a_participant

  def winner_is_a_participant
    if winner
      if ![participant_1, participant_2].include?(winner)
        errors.add(:winner, "Winner must be a participant in the contest")
      end
    end
  end

  def set_default_status
    self.status = "active"
  end
end
