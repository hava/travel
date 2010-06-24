class CreateHolidays < ActiveRecord::Migration
  def self.up
    create_table :holidays do |t|
      t.string :name
      t.datetime :from_date
      t.datetime :to_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :holidays
  end
end