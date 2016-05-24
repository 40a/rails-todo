class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, limit: 255, null: false
      t.string :description
      t.string :status, limit: 8, null: false, default: 'plan'

      t.timestamps null: false
    end
  end
end
