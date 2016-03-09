Mailboxer::Conversation.destroy_all
Review.destroy_all
Proposal.destroy_all
Project.destroy_all
User.destroy_all

#==== ARTISTS ====

nicolas = User.create!({
    first_name: "Nicolas",
    last_name: "Lagarde",
    email: "nicolas@gmail.com",
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
    title: "Triangle de penrose",
    description: "Tatouage japonais autour de mon triangle de penrose",
    style: "Nature",
    price: 150,
    sku: "flo",
    name: "florent surfer",
  })

project_2 = Project.create({
    user: louis,
    title: "Dessin japonais cuisse",
    description: "Je veux ce dessin sur ma cuisse",
    style: "Japonais",
    price: 300,
    sku: "louis",
    name: "louis 2 pons",
  })

project_3 = Project.create({
    user: louis,
    title: "Dauphin et crâne",
    description: "Tout comme mon chanteur préféré",
    style: "Dessin",
    price: 100
  })

#==== PROPOSALS ====

proposal_1 = Proposal.create({
    user: nicolas,
    project: project_1,
    content: "Voici ma proposition"
  })

proposal_2 = Proposal.create({
    user: nicolas,
    project: project_2,
    content: "Voici ma proposition"
  })

Proposal.create({
    user: sylvain,
    project: project_2,
    content: "Voici ma proposition"
  })

#==== REVIEWS ====

Review.create({
    proposal: proposal_1,
    content: "Super dessinateur, je kiff",
    rating: 3
  })
