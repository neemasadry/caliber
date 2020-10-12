class CreateRoutineSubcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :routine_subcategories do |t|
      t.references :routine, null: false, foregin_key: true
      t.references :subcategory, null: false, foregin_key: true

      t.timestamps
    end
  end
end
