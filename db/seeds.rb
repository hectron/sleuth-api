# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
  { first_name: "Lennon", last_name: "Bailey", state: "FL", email: "fakeuser1@gmail.com" },
  { first_name: "Taylor", last_name: "Ramirez", state: "IL", email: "faketay1@gmail.com" }
])
