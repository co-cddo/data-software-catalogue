# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Rails.logger.info 'Seeding starting'
Seeder = Dibber::Seeder

Seeder.seed Organisation
Seeder.seed User, name_method: :email, overwrite: true

Seeder.report.each { |r| Rails.logger.info r }
# rubocop:disable Rails/Output
puts Seeder.report
# rubocop:enable Rails/Output
