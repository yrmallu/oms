class DisburseOrderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    OrderServices::Disburse.call
  end
end
