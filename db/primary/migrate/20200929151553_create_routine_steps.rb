class CreateRoutineSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :routine_steps do |t|
      t.references :routine, null: false, foregin_key: true

      t.string :name, null: false, limit: 125
      t.text :description, null: false, limit: 5000
      t.time :est_time, null: true
      t.references :product, null: true, foregin_key: true

      t.timestamps
    end
  end
end
