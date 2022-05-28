require 'rails_helper'

RSpec.describe OrderServices::Disburse do
  describe '.call' do
    let(:subject) { described_class.call }
    let!(:completed_order_amount_30) { create(:order, :completed) }
    let!(:completed_order_amount_250) { create(:order, :completed, amount: 250) }
    let!(:completed_order_amount_350) { create(:order, :completed, amount:350) }
    let!(:pending_order) { create(:order)}

    context 'with completed orders' do
      it 'when amount less than 50' do
        subject
        completed_order_amount_30.reload
        pending_order.reload
        expect(completed_order_amount_30.status).to eq('disbursed')
        expect(completed_order_amount_30.disbursed_amount).to eq(29.7)
        expect(completed_order_amount_30.fee).to eq(0.3)
        expect(pending_order.status).to eq('pending')
      end

      it 'when amount between 50 and 300' do
        subject
        completed_order_amount_250.reload
        expect(completed_order_amount_250.status).to eq('disbursed')
        expect(completed_order_amount_250.disbursed_amount).to eq(247.63)
        expect(completed_order_amount_250.fee).to eq(2.38)
      end 

      it 'when amount above 300' do
        subject
        completed_order_amount_350.reload
        expect(completed_order_amount_350.status).to eq('disbursed')
        expect(completed_order_amount_350.disbursed_amount).to eq(347.03)
        expect(completed_order_amount_350.fee).to eq(2.98)
      end    
    end
  end
end
