class RemoveIndexFromRegisteredApplications < ActiveRecord::Migration
  def change
    remove_index :registered_applications, column: :name, unique: false
  end
end
