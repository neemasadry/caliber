# 20201015160345
class CreateScraperAccount < ActiveRecord::Migration[6.0]
  def change
    create_table :scraper_accounts do |t|
      t.string :name
      t.belongs_to :owner, foreign_key: {to_table: :users}
      t.boolean :personal, default: false

      #t.jsonb :brand_avatar_data

      t.timestamps
    end
  end
end
