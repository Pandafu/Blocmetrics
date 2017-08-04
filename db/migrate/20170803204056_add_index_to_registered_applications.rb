class AddIndexToRegisteredApplications < ActiveRecord::Migration
  def change
    add_index :registered_applications, :name, unique: true
  end
end
