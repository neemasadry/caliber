### USERS BEGIN ###

User.destroy_all
Account.destroy_all

avatar_uploader = AvatarImageUploader.new(:store)

avatar_path = "db/seeds/avatar_images/"

puts "---------------- Begin: User ----------------"

# NO LONGER TRUE avatar_data intentionally left empty to use Gravatar by default

ninja3487_avatar = "futurama_bender.jpg"
ninja3487_avatar_file_path = File.new(Rails.root.join(avatar_path, ninja3487_avatar))
uploaded_ninja3487_avatar = avatar_uploader.upload(ninja3487_avatar_file_path)
user_ninja3487 = User.create!(
  email: "ninja3487@yahoo.com",
  password: "password",
  first_name: "Amin",
  last_name: "Yrdas",
  username: "Amin3487",
  avatar_image_data: uploaded_ninja3487_avatar.to_json,
  gender: "male",
  #state_code: "MI",
  country_code: "US",
  time_zone: "Eastern Time (US & Canada)",
  # account_type: 1,
  date_of_birth: "1995-03-14",
  admin: false,
  moderator: false,
  terms_of_service: true)
puts "#{user_ninja3487.username} created!\n"




# NO LONGER TRUE Neither avatar_data set or Gravatar being used
snake117_avatar = "duck_dodgers.jpg"
snake117_avatar_file_path = File.new(Rails.root.join(avatar_path, snake117_avatar))
uploaded_snake117_avatar = avatar_uploader.upload(snake117_avatar_file_path)
user_snake117 = User.create!(
  email: "snake117@gmail.com",
  password: "password",
  first_name: "Neema",
  last_name: "Sadry",
  username: "snake117",
  avatar_image_data: uploaded_snake117_avatar.to_json,
  gender: "male",
  #state_code: "MI",
  country_code: "US",
  time_zone: "Eastern Time (US & Canada)",
  # account_type: 2,
  date_of_birth: "1991-07-01",
  admin: true,
  moderator: false,
  terms_of_service: true)

puts "#{user_snake117.username} created!\n"




# file_sebastian = File.new(Rails.root.join('app/assets/images/avatar_blonde_man_30s.jpg'))
# uploaded_file_sebastian = uploader_avatar.upload(file_sebastian)
acosta_avatar = "avatar_blonde_man_30s.jpg"
acosta_avatar_file_path = File.new(Rails.root.join(avatar_path, acosta_avatar))
uploaded_acosta_avatar = avatar_uploader.upload(acosta_avatar_file_path)

#acosta_blob = {io: File.open(Rails.root.join(avatar_path, 'avatar_blonde_man_30s.jpg')), filename: "avatar_blonde_man_30s.jpg", content_type: "image/jpg"}
user_acosta = User.create!(
  email: "alex@costa.com",
  password: "password",
  avatar_image_data: uploaded_acosta_avatar.to_json,
  first_name: "Alex",
  last_name: "Costa",
  username: "AlexCosta",
  gender: "male",
  #state_code: "CA",
  country_code: "US",
  time_zone: "Pacific Time (US & Canada)",
  # account_type: 4,
  date_of_birth: "1987-10-15",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(acosta_blob)

# puts "Image attached: #{acosta_blob}"
# if User.find(3).avatar.attached?
#   puts "Avatar attached"
# else
#   "\nNOT ATTACHED\n"
# end
# puts "Image attached: #{user_acosta.acosta_blob}"
puts "#{user_acosta.username} created!\n"




# file_line = File.new(Rails.root.join('app/assets/images/avatar_brunette_girl_79.jpg'))
# uploaded_file_line = uploader_avatar.upload(file_line)

sgomez_avatar = "avatar_brunette_girl_79.jpg"
sgomez_avatar_file_path = File.new(Rails.root.join(avatar_path, sgomez_avatar))
uploaded_sgomez_avatar = avatar_uploader.upload(sgomez_avatar_file_path)

#sgomez_blob = {io: File.open(Rails.root.join(avatar_path, 'avatar_brunette_girl_79.jpg')), filename: "avatar_brunette_girl_79.jpg", content_type: "image/jpg"}
user_sgomez = User.create!(
  email: "sgomez@gmail.com",
  password: "password",
  avatar_image_data: uploaded_sgomez_avatar.to_json,
  first_name: "Selena",
  last_name: "Gomez",
  username: "selenagomez",
  gender: "female",
  #state_code: "CA",
  country_code: "US",
  time_zone: "Pacific Time (US & Canada)",
  # account_type: 5,
  date_of_birth: "1994-07-26",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(sgomez_blob)

puts "#{user_sgomez.username} created!\n"





# file_bryden = File.new(Rails.root.join('app/assets/images/avatar_man_brownHair_m2.png'))
#uploaded_file_bryden = uploader_avatar.upload(file_bryden)

amarino_avatar = "avatar_man_brownHair_m2.png"
amarino_avatar_file_path = File.new(Rails.root.join(avatar_path, amarino_avatar))
uploaded_amarino_avatar = avatar_uploader.upload(amarino_avatar_file_path)

#amarino_blob = {io: File.open(Rails.root.join(avatar_path, 'avatar_man_brownHair_m2.png')), filename: "avatar_man_brownHair_m2.png", content_type: "image/png"}
user_amarino = User.create!(
  email: "amarino@alpham.com",
  password: "password",
  avatar_image_data: uploaded_amarino_avatar.to_json,
  first_name: "Aaron",
  last_name: "Marino",
  username: "alpham",
  gender: "male",
  #state_code: "NY",
  country_code: "US",
  time_zone: "Eastern Time (US & Canada)",
  # account_type: 4,
  date_of_birth: "1977-12-23",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(amarino_blob)

puts "#{user_amarino.username} created!\n"





# file_ana = File.new(Rails.root.join('app/assets/images/avatar_blonde_girl.jpg'))
# uploaded_file_ana = uploader_avatar.upload(file_ana)

tswift_avatar = "avatar_blonde_girl.jpg"
tswift_avatar_file_path = File.new(Rails.root.join(avatar_path, tswift_avatar))
uploaded_tswift_avatar = avatar_uploader.upload(tswift_avatar_file_path)

#tswift_blob = {io: File.open(Rails.root.join(avatar_path, 'avatar_blonde_girl.jpg')), filename: "avatar_blonde_girl.jpg", content_type: "image/jpg"}
user_tswift = User.create!(
  email: "tswift@gmail.com",
  password: "password",
  avatar_image_data: uploaded_tswift_avatar.to_json,
  first_name: "Taylor",
  last_name: "Swift",
  username: "taylorswift",
  gender: "female",
  #state_code: "VA",
  country_code: "US",
  time_zone: "Pacific Time (US & Canada)",
  # account_type: 5,
  date_of_birth: "1989-12-23",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(tswift_blob)

puts "#{user_tswift.username} created!\n"






# file_heath = File.new(Rails.root.join('app/assets/images/avatar_man_darkBrownHair.jpg'))
# uploaded_file_heath = uploader_avatar.upload(file_heath)
#jzuniga_blob = {io: File.open(Rails.root.join(avatar_path, 'avatar_man_darkBrownHair.jpg')), filename: "avatar_man_darkBrownHair.jpg", content_type: "image/jpg"}

jzuniga_avatar = "avatar_man_darkBrownHair.jpg"
jzuniga_avatar_file_path = File.new(Rails.root.join(avatar_path, jzuniga_avatar))
uploaded_jzuniga_avatar = avatar_uploader.upload(jzuniga_avatar_file_path)

user_jzuniga = User.create!(
  email: "jzuniga@gmail.com",
  password: "password",
  avatar_image_data: uploaded_jzuniga_avatar.to_json,
  first_name: "Jose",
  last_name: "Zuniga",
  username: "josezuniga",
  gender: "male",
  #state_code: "TX",
  country_code: "US",
  time_zone: "Pacific Time (US & Canada)",
  # account_type: 4,
  date_of_birth: "1995-06-23",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(jzuniga_blob)

puts "#{user_jzuniga.username} created!\n"



kjenner_avatar = "kylie_jenner_avatar.jpg"
kjenner_avatar_file_path = File.new(Rails.root.join(avatar_path, kjenner_avatar))
uploaded_kjenner_avatar = avatar_uploader.upload(kjenner_avatar_file_path)

#kjenner_blob = {io: File.open(Rails.root.join(avatar_path, 'kylie_jenner_avatar.jpg')), filename: "kylie_jenner_avatar.jpg", content_type: "image/jpg"}
user_kjenner = User.create!(
  email: "kylie@jenner.com",
  password: "password",
  avatar_image_data: uploaded_kjenner_avatar.to_json,
  first_name: "Kylie",
  last_name: "Jenner",
  username: "kyliejenner",
  gender: "female",
  #state_code: "CA",
  country_code: "US",
  time_zone: "Eastern Time (US & Canada)",
  # account_type: 4,
  date_of_birth: "1995-06-23",
  admin: false,
  moderator: false,
  terms_of_service: true) #.avatar.attach(kjenner_blob)

puts "#{user_kjenner.username} created!\n"
### USERS END ###

#User.find_each(&:save)

puts "\n\t--- RESULTS ---\t\n"

puts "There are now #{User.count} rows in the users table."

User.reindex
puts "Reindexed: User"

puts "---------------- End: User ----------------"
