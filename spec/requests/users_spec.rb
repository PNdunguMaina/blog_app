require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      @first_user = User.create(Name: 'Lilly', Photo: 'https://i.imgur.com/1J3wQYt.jpg',
                                Bio: 'I am a student at Microverse')
      @first_post = Post.create(Title: 'Hello', Text: 'This is a post', author_id: @first_user.id)
    end

    it 'displays all users' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'display specific user' do
      get "/users/#{@first_user.id}"
      expect(response).to render_template(:show)
    end
  end
end
