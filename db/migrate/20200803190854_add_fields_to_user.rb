class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :username, :string, null: false, index: { unique: true }
    add_column :users, :avatar_image_data, :text, null: true
    add_column :users, :date_of_birth, :date, null: false
    add_column :users, :gender, :string, null: false
    #add_column :users, :state_code, :string, null: false
    add_column :users, :country_code, :string, null: false
    add_column :users, :moderator, :boolean, default: false
    #add_column :users, :, :integer, null: false, inclusion: 1..5, default: 1

    # # caching for acts_as_favoritor
    # add_column :users, :favoritor_score, :text
    # add_column :users, :favoritor_total, :text
    # add_column :users, :favoritable_score, :text
    # add_column :users, :favoritable_total, :text

    # # caching for acts_as_votable
    # add_column :users, :cached_votes_total, :integer, default: 0
    # add_column :users, :cached_votes_score, :integer, default: 0
    # add_column :users, :cached_votes_up, :integer, default: 0
    # add_column :users, :cached_votes_down, :integer, default: 0
    # add_column :users, :cached_weighted_score, :integer, default: 0
    # add_column :users, :cached_weighted_total, :integer, default: 0
    # add_column :users, :cached_weighted_average, :float, default: 0.0

  end
end
