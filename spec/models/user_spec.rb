require 'rails_helper'

RSpec.describe User, type: :model do
  user_one = User.new(name: 'Antonella')
  user_two = User.new(name: '')

  it 'the user name is valid' do
    expect(user_one).to be_valid
  end

  it 'the user name is not valid' do
    expect(user_two).not_to be_valid
  end

  it ' post_counter is an integer' do
    user_one.post_counter = 0.1
    expect(user_one).not_to be_valid
  end

  it 'post_counter is an inter' do
    user_one.post_counter = 1
    expect(user_one).to be_valid
  end

  it 'test method last_three_post return a maximun of 3 post' do
    user_three = User.new(name: 'josue')
    user_three.save

    5.times do
      Post.new(title: 'aaa', text: 'example', author: user_three).save
    end
    expect(user_three.last_three_post.length).to be_eql 3
  end
end
