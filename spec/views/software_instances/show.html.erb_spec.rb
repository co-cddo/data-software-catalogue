require 'rails_helper'

RSpec.describe "software_instances/show", type: :view do
  before(:each) do
    assign(:software_instance, SoftwareInstance.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Organisation Group/)
    expect(rendered).to match(/Team/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Provider Contact/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/License/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
