class AddSlugToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slug, :string, index: { unique: true }
  end
end
