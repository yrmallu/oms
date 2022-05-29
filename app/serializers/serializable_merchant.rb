class SerializableMerchant < JSONAPI::Serializable::Resource
  type :merchants

  has_many :orders do
    data do
      @object.orders.to_a
    end
  end

  attribute :disbursed_amount do 
    @object.orders.sum(:disbursed_amount)
  end

  attribute :name
  attribute :cif
end
