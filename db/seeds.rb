# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pledge.destroy_all
Reward.destroy_all
Project.destroy_all
User.destroy_all

user1 = User.create({email: "User1", password:"test", password_confirmation:"test"})
user2 = User.create({email: "User2", password:"test", password_confirmation:"test"})
backer1 = User.create({email: "Backer1", password:"test", password_confirmation:"test"})

proj1 = user1.projects.create({name:"project 1"})
proj2 = user2.projects.create({name:"project 2"})

Project.all.each do |proj|
	reward1 = proj.rewards.create({title:"100 bucks"})
	reward2 = proj.rewards.create({title: "200 bucks"})
	pledge = reward1.pledges.create(user: backer1)
	pledge = reward2.pledges.create(user: backer1)
end




