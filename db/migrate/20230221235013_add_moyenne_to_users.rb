class AddMoyenneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :moyenne, :integer
  end
end
