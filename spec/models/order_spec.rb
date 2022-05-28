require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to belong_to(:shopper) }
  end
end
