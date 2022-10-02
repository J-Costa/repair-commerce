class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :string do |t|
      t.string :state
      t.string :city
      t.string :dstrict
      t.string :number
      t.string :street
      t.string :cep
      t.string :complement
      t.references :user, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
