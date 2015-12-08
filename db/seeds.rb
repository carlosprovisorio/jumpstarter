# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

my_users = User.create([{name: "User1"},{name: "User2"}])
my_projects = Project.create([{name:"project 1"},{name:"project 2"}])
my_claims = Claim.create([{created_at:""},{created_at:""}])
my_rewards = Reward.create([{title:"100 bucks"},{title: "200 bucks"}])

# User has many projects
#my_users[0].projects << my_projects[0]

