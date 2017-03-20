class CreateAirs < ActiveRecord::Migration[5.0]
  def change
    create_table :airs do |t|
      t.string :city, default: "chongqing"
      t.string :pm_two_five
      t.string :aqi
      t.string :quality
      t.string :pm_ten
      t.string :time

      t.timestamps
    end
  end
end
