require 'rails_helper'

RSpec.describe "software_instances/new", type: :view do
  before(:each) do
    assign(:software_instance, SoftwareInstance.new(
      name: "MyString",
      organisation: nil,
      organisation_group: "MyString",
      team: "MyString",
      owner: "MyString",
      product: "MyString",
      provider: "MyString",
      provider_contact: "MyString",
      version: "MyString",
      description: "MyText",
      status: "MyString",
      internal: false,
      license: "MyString",
      quantity_purchased: 1,
      quantity_used: 1
    ))
  end

  it "renders new software_instance form" do
    render

    assert_select "form[action=?][method=?]", software_instances_path, "post" do

      assert_select "input[name=?]", "software_instance[name]"

      assert_select "input[name=?]", "software_instance[organisation_id]"

      assert_select "input[name=?]", "software_instance[organisation_group]"

      assert_select "input[name=?]", "software_instance[team]"

      assert_select "input[name=?]", "software_instance[owner]"

      assert_select "input[name=?]", "software_instance[product]"

      assert_select "input[name=?]", "software_instance[provider]"

      assert_select "input[name=?]", "software_instance[provider_contact]"

      assert_select "input[name=?]", "software_instance[version]"

      assert_select "textarea[name=?]", "software_instance[description]"

      assert_select "input[name=?]", "software_instance[status]"

      assert_select "input[name=?]", "software_instance[internal]"

      assert_select "input[name=?]", "software_instance[license]"

      assert_select "input[name=?]", "software_instance[quantity_purchased]"

      assert_select "input[name=?]", "software_instance[quantity_used]"
    end
  end
end
