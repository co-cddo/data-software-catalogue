require 'rails_helper'

RSpec.describe "software_instances/index", type: :view do
  before(:each) do
    assign(:software_instances, [
      SoftwareInstance.create!(
        name: "Name",
        organisation: nil,
        organisation_group: "Organisation Group",
        team: "Team",
        owner: "Owner",
        product: "Product",
        provider: "Provider",
        provider_contact: "Provider Contact",
        version: "Version",
        description: "MyText",
        status: "Status",
        internal: false,
        license: "License",
        quantity_purchased: 2,
        quantity_used: 3
      ),
      SoftwareInstance.create!(
        name: "Name",
        organisation: nil,
        organisation_group: "Organisation Group",
        team: "Team",
        owner: "Owner",
        product: "Product",
        provider: "Provider",
        provider_contact: "Provider Contact",
        version: "Version",
        description: "MyText",
        status: "Status",
        internal: false,
        license: "License",
        quantity_purchased: 2,
        quantity_used: 3
      )
    ])
  end

  it "renders a list of software_instances" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Organisation Group".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Team".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Owner".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Product".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Provider".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Provider Contact".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Version".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("License".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
