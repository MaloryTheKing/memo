require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :description => "MyText",
      :image_data => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[description]"

      assert_select "textarea[name=?]", "post[image_data]"

      assert_select "input[name=?]", "post[slug]"
    end
  end
end
