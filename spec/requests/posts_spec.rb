require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      @first_user = User.create(Name: 'Lilly', Photo: 'https://i.imgur.com/1J3wQYt.jpg',
                                Bio: 'I am a student at Microverse')
      @first_post = Post.create(Title: 'Hello', Text: 'This is a post', author_id: @first_user.id)
    end
    it 'displays all posts belonging to a certain user' do
      get "/users/#{@first_user.id}/posts/"
      expect(response).to render_template(:index)
    end

    it 'display a specific post' do
      get "/users/#{@first_user.id}/posts/#{@first_post.id}"
      expect(response).to render_template(:show)
    end
  end
end
