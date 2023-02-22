class AddModerneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :moderne, :string
  end
end
