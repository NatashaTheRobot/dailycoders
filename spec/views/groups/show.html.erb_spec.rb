require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "Name",
      :image_url => "Image Url",
      :description => "MyText",
      :private => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Image Url/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
