# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!([{
               email: 'aiman.ali100@outlook.com',
               password: 'aimanali',
               role: 'Manager',
               name: 'Manager 01'
             },
              {
                email: 'aiman.ali@devsinc.com',
                password: 'aimanali',
                role: 'Developer',
                name: 'Developer 01'
              },
              {
                email: 'qa@devsinc.com',
                password: 'aimanali',
                role: 'QA',
                name: 'QA 01'
              }])

Rails.logger.debug "Created #{User.count} users"
