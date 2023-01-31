class AddStatusToStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :statuses, :mh_main, :integer
    add_column :statuses, :ap_main, :integer
    add_column :statuses, :arc_main, :integer
    add_column :statuses, :aut_main, :integer
    add_column :statuses, :hyper_main, :integer
    add_column :statuses, :inner_main, :integer
    add_column :statuses, :union_main, :integer
    add_column :statuses, :status, :integer
    add_column :statuses, :sub, :integer
    add_column :statuses, :dame, :integer
    add_column :statuses, :final_dame, :integer
    add_column :statuses, :wepon, :integer
    add_column :statuses, :wepon_main_per, :integer
    add_column :statuses, :wepon_add_per, :integer
    add_column :statuses, :addwepon_main_per, :integer
    add_column :statuses, :addwepon_add_per, :integer
    add_column :statuses, :em_main_per, :integer
    add_column :statuses, :em_add_per, :integer
    add_column :statuses, :fb, :integer
    add_column :statuses, :union_sub, :integer
  end
end
