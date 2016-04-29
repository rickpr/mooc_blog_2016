require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:all) do
    @post = Post.create!(title: "I am not nil!", body: "Neither am I!")
  end
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      post: @post,
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
