
if Guide.count >= 1
	Guide.destroy_all
	ActiveRecord::Base.connection.reset_pk_sequence!('guides')
end

all_users = User.all

tag_list_options = ["fashion", "entrepreneurship", "business", "productivity", "leadership", "dating", "romance", "date night", "promotion", "career", "diet", "eating", "home decor", "stress management", "style", "hygiene", "grooming", "beauty", "makeup tutorial", "product list", "supplements", "weight loss", "muscle building", "nutrition"]

all_users.each do |user|

	user_accounts_array = []

	user.accounts.each do |account|
		user_accounts_array << account
	end # user.accounts.each

	user_accounts_entry = { "#{user.username.to_sym}" => user_accounts_array  }

	user_accounts_entry.each do |username_key, user_accounts|
		user_accounts.each do |account|

			random_number_of_guides = Random.new.rand(20..80)

			random_number_of_guides.times do

				random_number_of_tag_list_entries = Random.new.rand(3..10)

				Guide.create!(
					title: Faker::Lorem.words(5..7).join(" ").titleize,
					body: Faker::Lorem.paragraphs(10..12).join(" "),
					tag_list: tag_list_options.sample(random_number_of_tag_list_entries),
					user_id: account.owner.id,
					account_id: account.id,
					brand_id: (!account.personal? && account.name != "Enemy" ? account.brand.id : nil)
				)

			end # random_number_of_guides.times

			puts "Account: #{account.name} (for User: #{user.username}) has #{random_number_of_guides} Guides."

		end # user_accounts.each
	end # user_accounts_entry.each
end # all_users.each


puts "There are now #{Guide.count} rows in the guides table."
Guide.reindex
puts "Reindexed: Guide"
