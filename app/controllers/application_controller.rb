class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::RecordNotFound, with: :show_record_errors

  private
    def show_record_errors(exception)
      redirect_to "/404", alert: exception.message
    end
end
