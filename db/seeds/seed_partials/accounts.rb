
acosta = User.find_by(email: "alex@costa.com")
amarino = User.find_by(email: "amarino@alpham.com")
jzuniga = User.find_by(email: "jzuniga@gmail.com")
kjenner = User.find_by(email: "kylie@jenner.com")

puts "---------------- Begin: Account ----------------"

### Alex Costa
Account.new(
    name: "Forte",
    owner: acosta,
    personal: false
  ).account_users.new(user: acosta, admin: true).save!
puts "Forte created!"


### Aaron Marino
Account.new(
    name: "Pete & Pedro",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Pete & Pedro created!"

Account.new(
    name: "Tiege Hanley",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Tiege Hanley created!"

Account.new(
    name: "Enemy",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Enemy created!"


### Jose Zuniga
Account.new(
    name: "Jade Black",
    owner: jzuniga,
    personal: false
  ).account_users.new(user: jzuniga, admin: true).save!
puts "Jade Black created!"

Account.new(
    name: "ESNTLS",
    owner: jzuniga,
    personal: false
  ).account_users.new(user: jzuniga, admin: true).save!
puts "ESNTLS created!"


### Kylie Jenner
Account.new(
    name: "Kylie Skin",
    owner: kjenner,
    personal: false
  ).account_users.new(user: kjenner, admin: true).save!
puts "Kylie Skin created!"


puts "---------------- End: Account ----------------"
