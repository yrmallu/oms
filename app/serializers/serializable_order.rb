class SerializableOrder < JSONAPI::Serializable::Resource
  type :orders

  attribute :amount
  attribute :disbursed_amount
  attribute :fee
end
