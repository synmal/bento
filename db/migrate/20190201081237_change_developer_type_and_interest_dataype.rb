class ChangeDeveloperTypeAndInterestDataype < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :developer_type
    remove_column :users, :interest
    add_column :users, :developer_type, :string, array: true, default:[]
    add_column :users, :interest, :string, array: true, default:[]
  end
end
