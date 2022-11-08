require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'displays all posts belonging to a certain user' do
      get '/users/:id/posts/'
      expect(response).to render_template(:index)
      expect(response.body).to include('List of all posts of a certain author')
    end

    it 'display a specific post' do
      get '/users/:id/posts/:id'
      expect(response).to render_template(:show)
      expect(response.body).to include('List a specific post of an author')
    end
  end
end
