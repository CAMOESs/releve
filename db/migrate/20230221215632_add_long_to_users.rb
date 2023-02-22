class AddLongToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :allemand, :integer
    add_column :users, :esp, :integer
  end
end
