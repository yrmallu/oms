class DisbursementsController < ApplicationController
  include JsonRendering

  def index
    disburse_schema = DisbursementSchema.new.call(params.permit!.to_h)
    schema_output = disburse_schema.schema_result.output
    week = schema_output.dig(:data, :attributes, :week)
    year = schema_output.dig(:data, :attributes, :year)
    merchant_id = schema_output.dig(:data, :attributes, :merchant_id)

    render json: disburse_schema.errors.to_h, status: :unprocessable_entity and return if disburse_schema.errors.to_h.present?
 
    orders = OrderServices::Disbursements.new(week, year, merchant_id).call
    render_jsonapi(orders)
  end
end
