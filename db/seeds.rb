# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

###########
# App Data
###########

  ############
  # Categories
  ############

  puts "***** Seeding Categories"
  categories = CSV.read "#{ Rails.root }/db/seeds/categories.csv"
  categories.shift # Skip header
  categories.each do |category|
    Category.create name: category[0].strip
  end

  ############
  # Statuses
  ############

  puts "***** Seeding Statuses"
  statuses = CSV.read "#{ Rails.root }/db/seeds/statuses.csv"
  statuses.shift # Skip header
  statuses.each do |status|
    Status.create name: status[0].strip
  end

#######################
## Non-Production Data
#######################
unless Rails.env.production? || Rails.env.staging? || Rails.env.qa? || Rails.env.test?

  require 'factory_girl_rails'
  require 'faker'

  ##############
  # Sellers
  ##############

  puts "***** Seeding Sellers"
  num_sellers = rand(25..50)
  FactoryGirl.create_list :seller, num_sellers

  ############
  # Items
  ############

  puts "***** Seeding Items"
  Seller.find_each do |seller|
    num_items = rand(0..5)
    FactoryGirl.create_list :item, num_items, seller: seller
  end
end