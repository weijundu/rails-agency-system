user1 = User.create(
  email: "user1@lynk.com",
  password: "123456"
  )



Company.create(
  name: "Wates",
  intro: "Building contarctor",
  website: "www.wates.co.uk",
  address: "London",
  phone_number: "0123456789",
  user: user1
  )
