class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :content
      t.string :location
      t.string :date
      t.integer :priority

      t.timestamps
    end
  end
end
