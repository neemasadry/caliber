class AddLikeAndFavoriteCachingToUser < ActiveRecord::Migration[6.0]
  def change

    # caching for acts_as_favoritor
    add_column :users, :favoritor_score, :text
    add_column :users, :favoritor_total, :text
    add_column :users, :favoritable_score, :text
    add_column :users, :favoritable_total, :text

    # caching for acts_as_votable
    add_column :users, :cached_votes_total, :integer, default: 0
    add_column :users, :cached_votes_score, :integer, default: 0
    add_column :users, :cached_votes_up, :integer, default: 0
    add_column :users, :cached_votes_down, :integer, default: 0
    add_column :users, :cached_weighted_score, :integer, default: 0
    add_column :users, :cached_weighted_total, :integer, default: 0
    add_column :users, :cached_weighted_average, :float, default: 0.0

  end
end
