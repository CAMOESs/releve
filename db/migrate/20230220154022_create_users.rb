class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.integer :lecture
      t.integer :commecri
      t.integer :anglais
      t.integer :math
      t.integer :pct
      t.integer :svt
      t.integer :hisgeo

      t.timestamps
    end
  end
end
