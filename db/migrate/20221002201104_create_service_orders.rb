class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders, id: :string do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true, type: :string
      t.references :device, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
