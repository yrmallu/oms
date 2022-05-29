module JsonRendering
  extend ActiveSupport::Concern

  # Add pagination, filtering when ever it becomes necessary
  def render_jsonapi(resource, options = {})
    render jsonapi: resource, **options.merge(include: options[:include] || params[:include], expose: { context: self })
  end
end
