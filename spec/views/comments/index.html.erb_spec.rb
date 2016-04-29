require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:all) do
    @post = Post.create!(title: "I am not nil!", body: "Neither am I!")
  end
  before(:each) do
    assign(:comments, [
      Comment.create!(
        post: @post,
        body: "MyText"
      ),
      Comment.create!(
        post: @post,
        body: "MyText"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: /Post/, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
