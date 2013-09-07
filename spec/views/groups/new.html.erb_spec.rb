require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :name => "MyString",
      :image_url => "MyString",
      :description => "MyText",
      :private => false
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groups_path, "post" do
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "input#group_image_url[name=?]", "group[image_url]"
      assert_select "textarea#group_description[name=?]", "group[description]"
      assert_select "input#group_private[name=?]", "group[private]"
    end
  end
end
