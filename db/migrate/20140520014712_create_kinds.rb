class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end
