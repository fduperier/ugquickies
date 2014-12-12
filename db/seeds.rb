# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Création de quelques User Groups
user_group_jug = UserGroup.find_or_create_by!(name: "Geneva JUG")
puts 'CREATED USER GROUPS: ' << user_group_jug.name

user_group = UserGroup.find_or_create_by!(name: "GVA .NET User Group")
puts 'CREATED USER GROUPS: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Scala Romandie")
puts 'CREATED USER GROUPS: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Docker Geneva")
puts 'CREATED USER GROUPS: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Geneva MUG")
puts 'CREATED USER GROUPS: ' << user_group.name
