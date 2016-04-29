require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:all) do
    @post = Post.create!(title: "I am not nil!", body: "Neither am I!")
  end
  before(:each) do
    assign(:comment, Comment.new(
      post: @post,
      body: "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
