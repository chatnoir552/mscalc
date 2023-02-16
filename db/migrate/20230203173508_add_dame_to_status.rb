class AddDameToStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :statuses, :bossdamage, :integer
    add_column :statuses, :criticaldamage, :integer
    add_column :statuses, :criticalper, :integer
  end
end
