class AddAccountIdToUser < ActiveRecord::Migration[6.0]
  def change
    #JLS
    add_column :users, :account_id, :integer, default: 1
  end
end
