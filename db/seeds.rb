Review.destroy_all
Proposal.destroy_all
Project.destroy_all
User.destroy_all

#==== ARTISTS ====

nicolas = User.create!({
    first_name: "Nicolas",
    last_name: "Lagarde",
    email: "lagardenicolas@gmail.com",
    password: "123soleil",
    artist: true
  })

sylvain = User.create!({
    first_name: "Sylvain",
    last_name: "Volpeo",
    email: "volpeo@gmail.com",
    password: "123soleil",
    artist: true
  })

User.create!({
    first_name: "Pablo",
    last_name: "Picasso",
    email: "pabolito@gmail.com",
    password: "123soleil",
    artist: true
  })

#==== CLIENTS ====

flo = User.create!({
    first_name: "Flo",
    last_name: "Surfer",
    email: "flo@gmail.com",
    password: "123soleil",
    artist: false
  })

louis = User.create!({
    first_name: "Louis",
    last_name: "Pons",
    email: "louispons@gmail.com",
    password: "123soleil",
    artist: false
  })

User.create!({
    first_name: "Josiane",
    last_name: "Rodriguez",
    email: "soleil@gmail.com",
    password: "123soleil",
    artist: false
  })

#==== PROJECTS ====

project_1 = Project.create({
    user: flo,
    description: "Tatouage japonais autour de mon triangle de penrose",
    style: "Nature",
    price: 150
  })

project_2 = Project.create({
    user: louis,
    description: "Je veux ce dessin sur ma cuisse",
    style: "Japonais",
    price: 300
  })

#==== PROPOSALS ====

proposal_1 = Proposal.create({
    user: nicolas,
    project: project_1
  })

Proposal.create({
    user: sylvain,
    project: project_2
  })

#==== REVIEWS ====

Review.create({
    proposal: proposal_1,
    content: "Super dessinateur, je kiff",
    rating: 3
  })

# user_list.each do |user_data|
#   user = User.create!(user_data)
#   user.projects.create!(user_data[:project]) if user_data[:project].present?
# end
