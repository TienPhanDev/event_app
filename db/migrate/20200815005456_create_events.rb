class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.date :date
      t.integer :price
      t.integer :tickets_remaining
      t.integer :capacity
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
