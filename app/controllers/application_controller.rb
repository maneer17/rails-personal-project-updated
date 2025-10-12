class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  rescue_from ActiveRecord::RecordNotFound, with: :show_record_errors

  private
    def show_record_errors(exception)
      redirect_to "/404", alert: exception.message
    end

    def current_user
      if request.headers["HTTP_AUTHORIZATION"]
        token = request.headers["HTTP_AUTHORIZATION"].split(" ").last
        decoded = JsonWebToken.decode_token(token)
        Student.find(decoded[0])
      else
        nil
      end
    end
end
