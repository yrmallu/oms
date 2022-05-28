class DisbursementSchema < Dry::Validation::Contract
  params do
    required(:data).schema do
      required(:attributes).schema do
        optional(:merchant_id)
        required(:week).filled
        required(:year).filled
      end
    end
  end
end
