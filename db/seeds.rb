Profile.delete_all
Company.delete_all
User.delete_all

user1 = User.create(
  email: "user1@lynk.com",
  password: "123456",
  role: "host"
  )

Company.create(
  name: "Wates",
  intro: "Building contarctor",
  website: "www.wates.co.uk",
  address: "London",
  phone_number: "0123456789",
  user: user1
  )

user2 = User.create(
  email: "user2@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Sosa",
  intro: "Building contarctor",
  website: "www.sosa.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user2
  )

user3 = User.create(
  email: "user3@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Gustavo",
  intro: "Building contarctor",
  website: "www.gustavo.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user3
  )

user4 = User.create(
  email: "user4@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Adolfos",
  intro: "Financial Services",
  website: "www.adolfoswebsite.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user4
  )

user5 = User.create(
  email: "user5@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Morgan",
  intro: "Banking",
  website: "www.morgank.co.uk",
  address: "Barnet",
  phone_number: "0123456789",
  user: user5
  )

user6 = User.create(
  email: "user6@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Krischers",
  intro: "Building contarctor",
  website: "www.krischers.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user6
  )

user7 = User.create(
  email: "user7@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Asias",
  intro: "Building contarctor",
  website: "www.asias.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user7
  )

user8 = User.create(
  email: "user8@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Hera",
  intro: "Building contarctor",
  website: "www.heras.co.uk",
  address: "Hackney",
  phone_number: "0123456789",
  user: user8
  )

user9 = User.create(
  email: "user9@lynk.com",
  password: "123456",
  role:"host"
  )

Company.create(
  name: "Ben",
  intro: "Building contarctor",
  website: "www.ben.co.uk",
  address: "Wandsworth",
  phone_number: "0123456789",
  user: user9
  )

user10 = User.create(
  email: "user10@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Ben",
  last_name: "Jones",
  cv: "No experience",
  trade: "carpenter",
  skills: "good with hammer",
  borough: "Wandsworth",
  user: user10
  )

user11 = User.create(
  email: "user11@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "John",
  last_name: "Smith",
  cv: "No experience",
  trade: "boilermaker",
  skills: "good with boilers",
  borough: "Wandsworth",
  user: user11
  )

user12 = User.create(
  email: "user12@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Gustavo",
  last_name: "Sosa",
  cv: "Lots of experience",
  trade: "electrician",
  skills: "good with bulbs",
  borough: "Wandsworth",
  user: user12
  )

user13 = User.create(
  email: "user13@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Morgan",
  last_name: "Krischer",
  cv: "Lots of experience",
  trade: "plasterer",
  skills: "good with plaster",
  borough: "Wandsworth",
  user: user13
  )

user14 = User.create(
  email: "user14@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Vincent",
  last_name: "Du",
  cv: "Lots of experience",
  trade: "plumber",
  skills: "good with faucets",
  borough: "Croydon",
  user: user14
  )

user15 = User.create(
  email: "user15@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Asia",
  last_name: "Jones",
  cv: "Lots of experience",
  trade: "plumber",
  skills: "good with faucets",
  borough: "Croydon",
  user: user15
  )

user16 = User.create(
  email: "user16@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Profile.create(
  first_name: "Juan",
  last_name: "Perez",
  cv: "Lots of experience",
  trade: "boilermaker",
  skills: "good with boilers",
  borough: "Croydon",
  user: user16
  )

user17 = User.create(
  email: "user17@lynk.com",
  password: "123456",
  role:"apprentice"
  )

Company.create(
  name: "Elite",
  intro: "Building contarctor",
  website: "www.elite.co.uk",
  address: "Croydon",
  phone_number: "0123456789",
  user: user17
  )
