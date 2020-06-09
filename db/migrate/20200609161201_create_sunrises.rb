class CreateSunrises < ActiveRecord::Migration[6.0]
  def change
    create_table :sunrises do |t|
      t.float :lat
      t.float :lng
      t.date :date
      t.string :sunrise_time

      t.timestamps
    end
  end
end
