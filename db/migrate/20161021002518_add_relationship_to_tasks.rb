class AddRelationshipToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :users, index: true
  end
end
