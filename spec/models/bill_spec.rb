require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:user) { User.create(name: 'Jeff', email: 'jeff@mail.com', password: 'railsrails') }
  let(:cat) { Cat.create(name: 'Shopping', author: user) }
  let(:bill) { Bill.create(name: 'Suit', amount: 12, author: user) }
  let(:cat_bill) { CatBill.create(cat_id: cat.id, bill_id: bill.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(bill).to be_valid }
    end

    it 'valid expense_category' do
      expect(cat_bill).to be_valid
    end

    it 'should valid name ' do
      bill.name = nil
      expect(bill).to_not be_valid
    end
    it 'should valid amount ' do
      bill.amount = -10
      expect(bill).to_not be_valid
    end
    it 'should valid amount ' do
      bill.amount = 10
      expect(bill).to be_valid
    end
  end
end
