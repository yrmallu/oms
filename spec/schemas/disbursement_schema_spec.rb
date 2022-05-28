require 'rails_helper'

RSpec.describe DisbursementSchema do
  let(:params) do
    {
      data: {
        attributes: {
          week: 1,
          year: 2020,
          merchant_id: 1
        }
      }
    }
  end

  let(:invalid_params) do
    {
      data: {
        attributes: {
          merchant_id: 1
        }
      }
    }
  end  

  context 'with valid params' do
    it 'passes validation' do
      schema = described_class.new.call(params)

      expect(schema.errors.to_h).to eq({})
    end
  end

  context 'when required fields are missing' do
    it 'requires week' do
      schema = described_class.new.call(invalid_params)
      errors = schema.errors.to_h.dig(:data, :attributes)
      expect(errors[:week]).to include('is missing')
    end

    it 'requires year' do
      schema = described_class.new.call(invalid_params)
      errors = schema.errors.to_h.dig(:data, :attributes)
      expect(errors[:year]).to include('is missing')
    end    
  end
end
