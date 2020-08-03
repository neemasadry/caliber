

acosta = User.find_by(email: "alex@costa.com")
amarino = User.find_by(email: "amarino@alpham.com")
jzuniga = User.find_by(email: "jzuniga@gmail.com")
kjenner = User.find_by(email: "kylie@jenner.com")

# all_users = [acosta, amarino, jzuniga, kjenner]

# all_users.each do |user|
#   user_account = user.accounts.where.not(name: user.name)
#   puts user_account
#   #user_account.destroy
# end

puts "---------------- Begin: Account ----------------"

### Alex Costa
Account.create!(
    name: "Forte",
    owner: acosta,
    personal: false
  )
puts "Forte created!"


### Aaron Marino
Account.create!(
    name: "Pete & Pedro",
    owner: amarino,
    personal: false
  )
puts "Pete & Pedro created!"

Account.create!(
    name: "Tiege Hanley",
    owner: amarino,
    personal: false
  )
puts "Tiege Hanley created!"

Account.create!(
    name: "Enemy",
    owner: amarino,
    personal: false
  )
puts "Enemy created!"


### Jose Zuniga
Account.create!(
    name: "Jade Black",
    owner: jzuniga,
    personal: false
  )
puts "Jade Black created!"

Account.create!(
    name: "ESNTLS",
    owner: jzuniga,
    personal: false
  )
puts "ESNTLS created!"


### Kylie Jenner
Account.create!(
    name: "Kylie Skin",
    owner: kjenner,
    personal: false
  )
puts "Kylie Skin created!"


puts "---------------- End: Account ----------------"
