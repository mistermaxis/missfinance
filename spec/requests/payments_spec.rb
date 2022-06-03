require 'rails_helper'

RSpec.describe 'Category', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'john', email: 'john@mail.com', password: 'password') }
  let(:category) { user.cats.create(name: 'Shopping') }
  let(:bill) { category.bills << user.bills.create(name: 'Shirt', amount: 3) }

  describe 'GET /index' do
    before do
      sign_in user
      get cat_path(category.id)
    end

    it 'respons to html' do
      expect(response.body).to include 'SHOPING'
    end
  end
end