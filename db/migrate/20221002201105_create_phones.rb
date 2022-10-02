class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones, id: :string do |t|
      t.string :prefix
      t.string :number
      t.string :type
      t.references :user, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
