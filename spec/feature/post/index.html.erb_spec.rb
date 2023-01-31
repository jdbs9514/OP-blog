require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Tom', bio: 'This is the bio',
                          photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
      @id = @user.id
      Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
      Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
      Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
      @post4 = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
      @comment1 = Comment.create(post: @post4, author: @user, text: 'This is the 1st comment on the 4th post')
      visit user_posts_path(@user)
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the page title' do
      expect(page).to have_content('Post information for user')
    end

    it 'shows the proper user photo' do
      expect(page.body).to include('https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number of posts: 4')
    end

    it 'shows a post title (Hello 1)' do
      expect(page).to have_content('Hello 1')
    end

    it 'shows part of a post body (This is my first post)' do
      expect(page).to have_content('This is my first post')
    end

    it 'shows the 1st comment on a post (This is the 1st comment on the 4th post)' do
      expect(page).to have_content('This is the 1st comment on the 4th post')
    end

    it 'shows number of comments a post has' do
      expect(page.body).to include('Comments: 1')
    end

    it 'shows number of likes a post has' do
      expect(page.body).to include('Likes: 0')
    end

    it 'shows the Pagination button' do
      expect(page.body).to include('Pagination')
    end

    it 'redirect to post show page when a post is clicked' do
      click_link(@post4.title)
      expect(current_path) == (user_post_path(@user, @post4))
    end
  end
end
