class AddParticipantsToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :participant_1, :string
    add_column :contests, :participant_2, :string
    add_column :contests, :winner, :string
  end
end
