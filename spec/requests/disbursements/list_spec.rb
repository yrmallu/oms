require 'rails_helper'

RSpec.describe 'GET /disbursements' do
  let(:path) { disbursements_url }
  let(:params) do
    {
      data: {
        attributes: {
          week: Time.current.strftime('%U').to_i,
          year: Time.current.year
        }
      }
    }
  end

  let(:merchant) { create(:merchant) }
  let(:shopper) { create(:shopper) }
  let(:order) { create(:order, :disbursed) }

  context 'with valid params' do
    it 'returns disbursements' do
      get path, params: params
      expect(response.status).to be(200)
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        data: {
          attributes: {
            week: Time.current.strftime('%U').to_i
          }
        }
      }
    end

    it 'should respond with 422' do
      get path, params: params
      expect(response.status).to be(422)
    end
  end
end
