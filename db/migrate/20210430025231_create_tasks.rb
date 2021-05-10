class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.datetime :daytime
      t.datetime :endtime_at
      t.integer :priority, default: 1, null: false
      t.integer :status, default: 1, null: false
      t.timestamps
    end
  end
end
