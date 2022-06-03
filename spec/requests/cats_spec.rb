require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'John', email: 'john@mail.com', password: 'password') }
  let(:category) { user.categories.create(name: 'Shopping') }
  describe 'GET /index' do
    before do
      sign_in user
      get cats_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_cat_path
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end