class CreateRedFlagRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :red_flag_records do |t|
      t.text :title
      t.text :description
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :status, default: 0
      t.text :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
