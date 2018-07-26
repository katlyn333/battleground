class Contest < ActiveRecord::Base
  AVAILABLE_STATUSES = ["active", "finished"]
  validates :status, :inclusion=> { :in => AVAILABLE_STATUSES }
end
