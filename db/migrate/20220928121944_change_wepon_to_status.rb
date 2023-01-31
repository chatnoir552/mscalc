class ChangeWeponToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :statuses, :wepon, :float
  end
end
