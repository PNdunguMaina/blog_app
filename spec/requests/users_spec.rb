require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'displays all users' do
      get '/users/'
      expect(response).to render_template(:index)
      expect(response.body).to include('List of all users')
    end

    it 'display specific user' do
      get '/users/:id'
      expect(response).to render_template(:show)
      expect(response.body).to include('List a certain author')
    end
  end
end
