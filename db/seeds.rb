# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# rubocop:disable Rails/Output
Rails.logger.info 'Seeding starting'
Seeder = Dibber::Seeder

Seeder.monitor Organisation
Seeder.monitor SoftwareInstance
Seeder.seed User, name_method: :email, overwrite: true

require 'csv'
csv_path = Rails.root.join('db/seeds/software_instances.csv')
software_data = CSV.parse(File.read(csv_path), headers: true)

organisations = Seeder.objects_from('organisations.yml')
organisations.transform_values! {|hash| hash['name']}

software_data.each_with_index do |datum, i|
  hash = datum.to_h
  organisation_acronym = hash.delete('organisation')
  organisation = Organisation.find_or_create_by!(tag: organisation_acronym.downcase) do |org|
    org.name = organisations[organisation_acronym]
  end

  result = SoftwareInstance.find_or_create_by!(organisation_id: organisation.id, product: hash['product']) do |software_instance|
    hash['internal'] = hash['internal']&.downcase == 'internal'
    software_instance.attributes = hash
  end
  puts "Software item #{i + 1} save failed: #{result.errors.full_messages.to_sentence}" unless result.valid?
end

PgSearch::Multisearch.rebuild SoftwareInstance

Seeder.report.each { |r| Rails.logger.info r }
puts Seeder.report
# rubocop:enable Rails/Output
