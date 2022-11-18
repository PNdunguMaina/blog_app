require 'rails_helper'

RSpec.describe User, type: :feature do
  before :each do
    @first_user = User.create(Name: 'John Doe',
                              # rubocop:disable Layout/LineLength
                              Photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', Bio: 'Mentor at Microverse')
    # rubocop:enable Layout/LineLength
    @first_post = Post.create(author: @first_user, Title: 'Slamander', Text: 'Type of an animal')
    @second_post = Post.create(author: @first_user, Title: 'Cactus', Text: 'Type of a plant')
    @third_post = Post.create(author: @first_user, Title: 'Agikuyu', Text: 'Tribe found in Africa')
    @fourth_post = Post.create(author: @first_user, Title: '1944', Text: 'Year when World War II started')
  end

  context 'User index page' do
    it 'displays the username of all other users' do
      visit users_path
      expect(page).to have_content('John Doe')
    end

    it 'displays the profile picture for each user' do
      visit '/users/'
      expect(page).to have_css('img[src*="https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"]')
    end

    it 'displays the number of posts each user has written' do
      visit '/users/'
      expect(page).to have_content('Number of posts: 4')
    end

    it 'redirects to user show page when user is clicked' do
      visit '/users/'
      click_link 'John Doe'
      expect(page).to have_current_path("/users/#{@first_user.id}/")
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'User show page' do
    it 'displays the user profile picture' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_css('img[src*="https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"]')
    end

    it 'displays the username' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_content('John Doe')
    end

    it 'displays the number of posts the user has written' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_content('Number of posts: 4')
    end

    it 'displays  the user bio' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_content('Bio')
      expect(page).to have_content('Mentor at Microverse')
    end

    it 'displays the user first 3 posts' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_content(@fourth_post.Title)
      expect(page).to have_content(@third_post.Title)
      expect(page).to have_content(@second_post.Title)
      expect(page).to have_content(@fourth_post.Text)
      expect(page).to have_content(@third_post.Text)
      expect(page).to have_content(@second_post.Text)
    end

    it 'displays a button that lets me view all of a user posts' do
      visit "/users/#{@first_user.id}/"
      expect(page).to have_link('See all posts')
    end

    it 'When I click a user post,  it redirects me to that post show page' do
      visit "/users/#{@first_user.id}/"
      click_link @fourth_post.Title
      expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@fourth_post.id}/")
    end

    it 'When I click to see all posts, it redirects me to the user post index page' do
      visit "/users/#{@first_user.id}/"
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{@first_user.id}/posts/")
    end
    # rubocop:enable Metrics/BlockLength
  end
end
