require 'rails_helper'

RSpec.describe Shopper, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:orders) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:nif) }
    end

    context 'uniqness' do
      it 'with same email' do
        shopper_1 = create(:shopper, email: 'test@example.com')
        shopper_2 = build(:shopper, email: 'test@example.com')
        expect(shopper_2).not_to be_valid
      end

      it 'with same nif' do
        shopper_1 = create(:shopper, nif: 'A12121')
        shopper_2 = build(:shopper, nif: 'A12121')
        expect(shopper_2).not_to be_valid
      end
    end

    context 'email format' do
      it 'invalid email' do
        shopper = build(:shopper, email: 'test')
        expect(shopper).not_to be_valid
      end

      it 'valid email' do
        shopper = build(:shopper, email: 'test@example.com')
        expect(shopper).to be_valid
      end      
    end
  end
end
