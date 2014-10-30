class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description, null: false
    end

    add_index :courses, :name, unique: true
  end
end
