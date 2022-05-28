require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:orders) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:cif) }
    end

    context 'uniqness' do
      it 'with same email' do
        merchant_1 = create(:merchant, email: 'test@example.com')
        merchant_2 = build(:merchant, email: 'test@example.com')
        expect(merchant_2).not_to be_valid
      end

      it 'with same cif' do
        merchant_1 = create(:merchant, cif: 'A12121')
        merchant_2 = build(:merchant, cif: 'A12121')
        expect(merchant_2).not_to be_valid
      end
    end

    context 'email format' do
      it 'invalid email' do
        merchant = build(:merchant, email: 'test')
        expect(merchant).not_to be_valid
      end

      it 'valid email' do
        merchant = build(:merchant, email: 'test@example.com')
        expect(merchant).to be_valid
      end      
    end
  end
end
