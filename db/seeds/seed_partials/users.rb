### USERS BEGIN ###

User.destroy_all
Account.destroy_all

avatar_path = "db/seeds/avatar_images/"

puts "---------------- Begin: User ----------------\n\n"

ninja3487_avatar = "futurama_bender.jpg"
ninja3487_blob = { io: File.open(Rails.root.join(avatar_path, ninja3487_avatar)), filename: ninja3487_avatar, content_type: "image/jpg" }
user_ninja3487 = User.create!(
	email: "ninja3487@yahoo.com",
	password: "password",
	first_name: "Amin",
	last_name: "Yrdas",
	username: "Amin3487",
	gender: "Male",
	country_code: "US",
	time_zone: "Eastern Time (US & Canada)",
	date_of_birth: "1995-03-14",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_ninja3487.avatar.attach(ninja3487_blob)
puts "ninja3487 created!\n"


snake117_avatar = "duck_dodgers.jpg"
snake117_blob = {io: File.open(Rails.root.join(avatar_path, snake117_avatar)), filename: snake117_avatar, content_type: "image/jpg"}
user_snake117 = User.create!(
	email: "snake117@gmail.com",
	password: "password",
	first_name: "Neema",
	last_name: "Sadry",
	username: "snake117",
	gender: "Male",
	country_code: "US",
	time_zone: "Eastern Time (US & Canada)",
	date_of_birth: "1991-07-01",
	admin: true,
	moderator: false,
	terms_of_service: true)

	user_snake117.avatar.attach(snake117_blob)

puts "snake117 created!\n"



acosta_avatar = "avatar_blonde_man_30s.jpg"
acosta_blob = {io: File.open(Rails.root.join(avatar_path, acosta_avatar)), filename: acosta_avatar, content_type: "image/jpg"}
user_acosta = User.create!(
	email: "alex@costa.com",
	password: "password",
	first_name: "Alex",
	last_name: "Costa",
	username: "AlexCosta",
	gender: "Male",
	country_code: "US",
	time_zone: "Pacific Time (US & Canada)",
	date_of_birth: "1987-10-15",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_acosta.avatar.attach(acosta_blob)

puts "alexcosta created!\n"



sgomez_avatar = "avatar_brunette_girl_79.jpg"
sgomez_blob = {io: File.open(Rails.root.join(avatar_path, sgomez_avatar)), filename: sgomez_avatar, content_type: "image/jpg"}
user_sgomez = User.create!(
	email: "sgomez@gmail.com",
	password: "password",
	first_name: "Selena",
	last_name: "Gomez",
	username: "selenagomez",
	gender: "Female",
	country_code: "US",
	time_zone: "Pacific Time (US & Canada)",
	date_of_birth: "1994-07-26",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_sgomez.avatar.attach(sgomez_blob)

puts "selenagomez created!\n"



amarino_avatar = "avatar_man_brownHair_m2.png"
amarino_blob = {io: File.open(Rails.root.join(avatar_path, amarino_avatar)), filename: amarino_avatar, content_type: "image/png"}
user_amarino = User.create!(
	email: "amarino@alpham.com",
	password: "password",
	first_name: "Aaron",
	last_name: "Marino",
	username: "alpham",
	gender: "Male",
	country_code: "US",
	time_zone: "Eastern Time (US & Canada)",
	date_of_birth: "1977-12-23",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_amarino.avatar.attach(amarino_blob)

puts "amarino created!\n"



tswift_avatar = "avatar_blonde_girl.jpg"
tswift_blob = {io: File.open(Rails.root.join(avatar_path, tswift_avatar)), filename: tswift_avatar, content_type: "image/jpg"}
user_tswift = User.create!(
	email: "tswift@gmail.com",
	password: "password",
	first_name: "Taylor",
	last_name: "Swift",
	username: "taylorswift",
	gender: "Female",
	country_code: "US",
	time_zone: "Pacific Time (US & Canada)",
	date_of_birth: "1989-12-23",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_tswift.avatar.attach(tswift_blob)

puts "taylorswift created!\n"



jzuniga_avatar = "avatar_man_darkBrownHair.jpg"
jzuniga_blob = {io: File.open(Rails.root.join(avatar_path, jzuniga_avatar)), filename: jzuniga_avatar, content_type: "image/jpg"}

user_jzuniga = User.create!(
	email: "jzuniga@gmail.com",
	password: "password",
	first_name: "Jose",
	last_name: "Zuniga",
	username: "josezuniga",
	gender: "Male",
	country_code: "US",
	time_zone: "Pacific Time (US & Canada)",
	date_of_birth: "1995-06-23",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_jzuniga.avatar.attach(jzuniga_blob)

puts "josezuniga created!\n"



kjenner_avatar = "kylie_jenner_avatar.jpg"
kjenner_blob = {io: File.open(Rails.root.join(avatar_path, kjenner_avatar)), filename: kjenner_avatar, content_type: "image/jpg"}
user_kjenner = User.create!(
	email: "kylie@jenner.com",
	password: "password",
	first_name: "Kylie",
	last_name: "Jenner",
	username: "kyliejenner",
	gender: "Female",
	country_code: "US",
	time_zone: "Eastern Time (US & Canada)",
	date_of_birth: "1995-06-23",
	admin: false,
	moderator: false,
	terms_of_service: true)

	user_kjenner.avatar.attach(kjenner_blob)

puts "kyliejenner created!\n"
### USERS END ###

puts "\n\t--- RESULTS ---\t\n"

puts "There are now #{User.count} rows in the users table."

User.reindex
puts "Reindexed: User"

puts "---------------- End: User ----------------\n\n"


puts "---------------- Begin: Collections ----------------\n\n"

users = [user_ninja3487, user_snake117, user_acosta, user_sgomez, user_amarino, user_tswift, user_jzuniga, user_kjenner]
collection_groups = [ "Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Top" ]

users.each do |user|
  collection_groups.each do |collection_group|
    next if user.gender == "Male" && collection_group == "Dress"

    user.collections.find_or_create_by(collection_type: collection_group)
    puts "#{collection_group} has been created for #{user.username}"
  end
  puts "#{user.username} now has #{user.collections.count} Collection groups.\n\n"
end

puts "---------------- End: Collections ----------------"
