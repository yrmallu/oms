module OrderServices
  class Disburse
    LOW_AMOUNT = 50
    MEDIUM_AMOUNT = 300

    LOW_AMOUNT_FEE = 0.01
    MEDIUM_AMOUNT_FEE = 0.0095
    MORE_AMOUNT_FEE = 0.0085

    def self.call
      Order.yet_to_disburse.in_batches do |orders|
        orders.each do |order|
          order.update(
            status: 'disbursed',
            disbursed_amount: disbursed_amount(order.amount).round(2),
            fee: transaction_fee(order.amount).round(2),
            disbursed_at: Time.zone.now
          )
        end
      end
    end

    private

    def self.disbursed_amount(amount)
      amount - transaction_fee(amount)
    end

    def self.transaction_fee(amount)
      amount * percentage(amount)
    end

    def self.percentage(amount)
      case
      when amount < LOW_AMOUNT
        LOW_AMOUNT_FEE
      when amount.between?(LOW_AMOUNT, MEDIUM_AMOUNT)
        MEDIUM_AMOUNT_FEE
      else
        MORE_AMOUNT_FEE
      end
    end
  end
end
