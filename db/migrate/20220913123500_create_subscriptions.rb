class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :titel
      t.integer :price
      t.boolean :status
      t.integer :frequency

      t.timestamps
    end
  end
end