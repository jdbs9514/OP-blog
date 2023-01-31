require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Josue', bio: 'This is the bio',
                          photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png', id: 1)
      @id = @user.id
      Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
      Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
      Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
      @post4 = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
      visit user_path(@id)
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the page title' do
      expect(page).to have_content('User information')
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
    end

    it 'shows the number of posts the user has written' do
      expect(page.body).to include('Number of posts: 4')
    end

    it 'shows the user bio' do
      expect(page).to have_content('User bio')
    end

    it 'shows only the users last 3 posts' do
      expect(page).to have_content('Hello 2')
      expect(page).to have_content('Hello 3')
      expect(page).to have_content('Hello 4')
      expect(page).not_to have_content('Hello 1')
    end

    it 'shows the See all posts button' do
      expect(page).to have_content('See all posts')
    end
  end
end
