require 'rails_helper'

RSpec.describe Post, type: :system do
  before :each do
    @first_user = User.create(Name: 'John Doe',
                              # rubocop:disable Layout/LineLength
                              Photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', Bio: 'Mentor at Microverse')
    # rubocop:enable Layout/LineLength
    @first_post = Post.create(author: @first_user, Title:, Text: 'Type of an animal')
    @second_post = Post.create(author: @first_user, Title: 'Cactus', Text: 'Type of a plant')
    @third_post = Post.create(author: @first_user, Title: 'Agikuyu', Text: 'Tribe found in Africa')
    @fourth_post = Post.create(author: @first_user, Title: '1944', Text: 'Year when World War II started')
    @first_comment = Comment.new(author: @first_user, post: @first_post, Text: 'I know that animal')
    @second_comment = Comment.new(author: @first_user, post: @first_post, Text: 'I know that animal')
  end

  describe 'User post index page' do
    # rubocop:disable Metrics/BlockLength
    context 'renders index page correctly' do
      it 'displays the user profile picture' do
        visit user_posts_path
        expect(page).to have_css('img[src*="https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"]')
      end

      it 'displays the user username' do
        visit user_posts_path
        expect(page).to have_content('John Doe')
      end

      it 'displays the number of posts the user has written' do
        visit user_posts_path
        expect(page).to have_content('Number of posts: 4')
      end

      it 'displays post title' do
        visit user_posts_path
        expect(page).to have_content(@first_post.Title)
      end

      it 'displays  some of the post body' do
        visit user_posts_path
        expect(page).to have_content(@first_post.Text)
      end

      it 'displays how many comments a post has' do
        visit user_posts_path
        expect(page).to have_content('Comments: 2')
      end

      it 'displays how many likes a post has' do
        visit user_posts_path
        expect(page).to have_content('Likes: 0')
      end

      it 'When I click on a post, it redirects me to that post show page' do
        visit user_posts_path
        click_link 'slamander'
        expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@first_post.id}/")
      end
    end
    # rubocop:enable Metrics/BlockLength

    context 'Post show page' do
      it 'displays the post title' do
        visit user_post_path
        expect(page).to have_content(@first_post.Title)
      end

      it 'displays the post body' do
        visit user_post_path
        expect(page).to have_content(@first_post.Text)
      end

      it 'displays how many comments it has' do
        visit user_post_path
        expect(page).to have_content('Number of comments: 2')
      end

      it 'displays how many likes it has' do
        visit user_post_path
        expect(page).to have_content('Number of likes: 0')
      end

      it 'displays how many likes it has' do
        visit user_post_path
        expect(page).to have_content('Number of likes: 0')
      end

      it 'displays the post author' do
        visit user_post_path
        expect(page).to have_content(@first_user.Name)
      end
    end
  end
end
