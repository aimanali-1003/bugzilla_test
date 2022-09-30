# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all

User.find_or_create_by(email: 'aiman.ali100@outlook.com', encrypted_password: 'aimanali', role: 'Manager',
                       name: 'Manager 01')
User.find_or_create_by(email: 'aiman.ali@devsinc.com', encrypted_password: 'aimanali', role: 'Developer',
                       name: 'Developer 01')
User.find_or_create_by(email: 'qa@devsinc.com', encrypted_password: 'aimanali', role: 'QA', name: 'qa 01')

Rails.logger.debug "Created #{User.count} users"
