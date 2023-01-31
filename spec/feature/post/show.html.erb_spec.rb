require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Dario', bio: 'This is the bio',
                          photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
      @id = @user.id
      @user2 = User.create(name: 'Pepe', bio: 'This is the bio',
                           photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
      @post4 = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
      @comment1 = Comment.create(post: @post4, author: @user2, text: 'This is the 1st comment on the 4th post')
      visit user_post_path(@user, @post4)
    end

    it 'shows a post title e.g. Hello 4' do
      expect(page).to have_content('Hello 4')
    end

    it 'shows the post author name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the page title' do
      expect(page).to have_content('Information for post')
    end

    it 'shows number of comments the post has' do
      expect(page.body).to include('Number of comments: 1')
    end

    it 'shows number of likes the post has' do
      expect(page.body).to include('Number of likes: 0')
    end

    it 'shows the whole post body (This is my fourth post)' do
      expect(page).to have_content('This is my fourth post')
    end

    it 'shows the author name of a comment' do
      expect(page).to have_content('Pepe')
    end

    it 'shows the whole body of a comment' do
      expect(page).to have_content('This is the 1st comment on the 4th post')
    end

    it 'shows the number of comments the post has' do
      expect(page.body).to include('Number of comments: 1')
    end

    it 'shows the number of likes a post has' do
      expect(page.body).to include('Number of likes: 0')
    end

    it 'has a button to give likes on the post' do
      expect(page.body).to include('Give like')
    end

    it 'has a text_area for writing comments' do
      expect(page.body).to include('Enter your comment here:')
    end

    it 'redirect to post show page when a post is clicked' do
      click_link('Back to list of posts')
      expect(current_path) == (user_posts_path(@user))
    end
  end
end
