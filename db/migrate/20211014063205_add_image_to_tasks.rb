class AddImageToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :img, :string
  end
end
