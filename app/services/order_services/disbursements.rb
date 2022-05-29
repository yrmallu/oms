module OrderServices
  class Disbursements
    attr_reader :week, :year, :merchant_id

    def initialize(week, year, merchant_id = nil)
      @week = week.to_i
      @year = year.to_i
      @merchant_id = merchant_id
    end

    def call
      Merchant.includes(:orders)
              .where('orders.status': 'disbursed')
              .where("Date(orders.disbursed_at) BETWEEN ? AND ?", begining_of_the_week, ending_of_the_week)
              .where(merchant_condition)
    end

    def begining_of_the_week
      Date.commercial(year, week, 1)
    end

    def ending_of_the_week
      Date.commercial(year, week, 7)
    end

    def merchant_condition
      merchant_id.present? ? "merchant_id = #{merchant_id}" : ''
    end
  end
end
