require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      title: "Title",
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end

  it "renders comments" do
    2.times { @post.comments.create!(body: "I am a comment.") }
    render
    assert_select "#comments>div", text: /I am a comment/, count: 2
  end
end
