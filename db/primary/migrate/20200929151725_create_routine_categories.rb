class CreateRoutineCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :routine_categories do |t|
      t.references :routine, null: false, foregin_key: true
      t.references :category, null: false, foregin_key: true

      t.timestamps
    end
  end
end
