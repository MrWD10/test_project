class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.string :task_type
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :title, unique: true
  end
end
