require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "MyString",
      :image_url => "MyString",
      :description => "MyText",
      :private => false
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "input#group_image_url[name=?]", "group[image_url]"
      assert_select "textarea#group_description[name=?]", "group[description]"
      assert_select "input#group_private[name=?]", "group[private]"
    end
  end
end
