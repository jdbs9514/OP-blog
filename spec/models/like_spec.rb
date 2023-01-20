require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Josue')
  user_two = User.new(name: 'Antonella')
  post = Post.new(author: user, title: 'example', text: 'example')
  like = Like.new(author: user_two, post: post)

  it 'new like is valid' do
    expect(like).to be_valid
  end
end
