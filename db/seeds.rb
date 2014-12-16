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
user_group_jug = UserGroup.find_or_create_by!(name: "Geneva JUG") do |ug|
  ug.picture_name = 'geneva-jug-duke-181.png'
end
puts 'CREATED USER GROUP: ' << user_group_jug.name

user_group = UserGroup.find_or_create_by!(name: "GVA .NET User Group") do |ug|
  ug.picture_name = 'geneva.net.jpeg'
end
puts 'CREATED USER GROUP: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Scala Romandie") do |ug|
  ug.picture_name = 'scala-romandie.jpeg'
end
puts 'CREATED USER GROUP: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Docker Geneva") do |ug|
  ug.picture_name = 'docker-geneva.jpeg'
end
puts 'CREATED USER GROUP: ' << user_group.name

user_group = UserGroup.find_or_create_by!(name: "Geneva MUG") do |ug|
  ug.picture_name = 'genevamug.jpeg'
end
puts 'CREATED USER GROUP: ' << user_group.name


# Création de quelques Quickies
quickie = Quickie.find_or_create_by!(title: "JUG Janvier") do |quickie|
  quickie.description = 'Quickie pour le JUG de Janvier'
  quickie.date = DateTime.strptime('01/01/2015 19:00:00', '%d/%m/%Y %H:%M:%S')
  quickie.user_group = user_group_jug
  quickie.creator = user
end
puts 'CREATED QUICKIE: ' << quickie.title

quickie = Quickie.find_or_create_by!(title: "JUG Février") do |quickie|
  quickie.description = 'Quickie pour le JUG de Février'
  quickie.date = DateTime.strptime('01/02/2015 19:00:00', '%d/%m/%Y %H:%M:%S')
  quickie.user_group = user_group_jug
  quickie.creator = user
end
puts 'CREATED QUICKIE: ' << quickie.title

