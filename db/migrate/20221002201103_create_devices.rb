class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices, id: :string do |t|
      t.string :brand
      t.string :model
      t.string :color
      t.text :observations
      t.text :defect
      t.references :user, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
