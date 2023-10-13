class CreateFruits < ActiveRecord::Migration[7.1]
  def change
    create_table :fruits do |t|
      t.string :name
      t.string :family
      t.string :order
      t.string :genus
      t.json :nutritions

      t.timestamps
    end
  end
end
