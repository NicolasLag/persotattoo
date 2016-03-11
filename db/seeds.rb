Mailboxer::Conversation.destroy_all
Review.destroy_all
Proposal.destroy_all
Project.destroy_all
User.destroy_all

#==== ARTISTS ====

starck = User.create!({
    first_name: "Philippe",
    last_name: "Starck",
    email: "starck@gmail.com",
    password: "123soleil",
    artist: true
  })

dali = User.create!({
    first_name: "Salvador",
    last_name: "Dali",
    email: "dali@gmail.com",
    password: "123soleil",
    artist: true
  })

User.create!({
    first_name: "Pablo",
    last_name: "Picasso",
    email: "picasso@gmail.com",
    password: "123soleil",
    artist: true
  })

User.create!({
    first_name: "Lady",
    last_name: "Gaga",
    email: "gaga@gmail.com",
    password: "123soleil",
    artist: true
  })

User.create!({
    first_name: "Audrey",
    last_name: "Putman",
    email: "putman@gmail.com",
    password: "123soleil",
    artist: true
  })

User.create!({
    first_name: "Albert",
    last_name: "Uderzo",
    email: "uderzo@gmail.com",
    password: "123soleil",
    artist: true
  })

#==== CLIENTS ====

louis = User.create!({
    first_name: "Louis",
    last_name: "Pons",
    email: "pons@gmail.com",
    password: "123soleil",
    artist: false
  })

User.create!({
    first_name: "Charles",
    last_name: "Pernet",
    email: "pernet@gmail.com",
    password: "123soleil",
    artist: false
  })

User.create!({
    first_name: "Nicolas",
    last_name: "Lagarde",
    email: "lagarde@gmail.com",
    password: "123soleil",
    artist: false
  })

User.create!({
    first_name: "Fanny",
    last_name: "Blanc",
    email: "blanc@gmail.com",
    password: "123soleil",
    artist: false
  })

User.create!({
    first_name: "Christelle",
    last_name: "Martin",
    email: "martin@gmail.com",
    password: "123soleil",
    artist: false
  })
