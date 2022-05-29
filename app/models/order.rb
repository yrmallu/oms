class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  enum status: { pending: 0, completed: 1, disbursed: 2 }

  scope :yet_to_disburse, -> { completed.where(disbursed_at: nil) }
end
