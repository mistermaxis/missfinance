require 'rails_helper'

RSpec.describe Cat, type: :model do
  let(:user) { User.create(name: 'Jeff', email: 'jeff@mail.com', password: 'railsrails') }
  let(:category) { Cat.create(name: 'Shopping', author_id: user.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(category).to be_valid }
    end

    it 'should allow valid name' do
      category.name = 'Jeff'
      expect(category).to be_valid
    end

    it 'should allow valid author_id' do
      category.author_id = nil
      expect(category).to_not be_valid
    end
  end
end
