class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :username, :string, null: false, index: { unique: true }
    add_column :users, :date_of_birth, :date, null: false
    add_column :users, :gender, :string, null: false
    add_column :users, :country_code, :string, null: false
    add_column :users, :moderator, :boolean, default: false
    #add_column :users, :account_type, :integer, null: false, inclusion: 1..5, default: 1

  end
end
