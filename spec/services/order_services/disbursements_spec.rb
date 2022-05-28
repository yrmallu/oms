require 'rails_helper'

RSpec.describe OrderServices::Disbursements do
  describe '#call' do
    let(:subject) { described_class.new(week, year).call }
    let(:week) { Time.current.strftime('%U').to_i }
    let(:year) { Time.current.year }
    let!(:disbursed_orders) { create_list(:order, 2, :disbursed)}

    context 'without merchant id' do
      it do
        subject
        expect(subject.count).to eq(2)
      end
    end

    context 'with merchant id' do
      let(:merchant) { create(:merchant) }
      let!(:mechant_disbursed_orders) { create_list(:order, 5, :disbursed, merchant: merchant)}
      it do
        subject = described_class.new(week, year, merchant.id).call
        expect(subject.count).to eq(5)
      end
    end
  end
end
