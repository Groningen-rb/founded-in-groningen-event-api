class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :original_provider
      t.integer :original_id
      t.string :name
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :location
      t.string :rsvp_link

      t.timestamps null: false
    end
  end
end
