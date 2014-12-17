class ErrorsController < ActionController::Base
  layout 'application'

  caches_page :not_found, :internal_error, :unprocessable_entity

  def not_found
  end

  def internal_error
  end

  def unprocessable_entity
  end
end