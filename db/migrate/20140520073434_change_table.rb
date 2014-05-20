class ChangeTable < ActiveRecord::Migration
  def change
  	change_column(:activities, :description, :text)
  	change_column(:articles , :description , :text)
  end
end
