require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Josue')
  post_one = Post.new(author: user, title: '', text: 'example')
  post_two = Post.new(author: user, title: 'jo', text: 'example')
  post_three = Post.new(author: user, title: 'Patience', text: 'example')
  post_four = Post.new(author: user, title: 'Patience', text: 'example')
  post_five = Post.new(author: user, title: 'Patience', text: 'example', comments_counter: 5)
  post_six = Post.new(author: user, title: 'patience', text: 'example')
  post_seven = Post.new(author: user, title: 'patience', text: 'example', likes_counter: 5)

  it 'post do not acept empty title' do
    expect(post_one).not_to be_valid
  end

  it 'post do not acept title less than 3 character' do
    expect(post_two).not_to be_valid
  end

  it 'post acept title more than 3 character' do
    expect(post_three).to be_valid
  end

  it 'test if comments_counter = 0' do
    expect(post_four.comments_counter).to be_eql 0
  end

  it 'test if comments_counter = 5' do
    expect(post_five.comments_counter).to be_eql 5
  end

  it 'test if likes_counter = 0' do
    expect(post_six.likes_counter).to be_eql 0
  end

  it 'test if likes_counter = 5' do
    expect(post_seven.likes_counter).to be_eql 5
  end
end
