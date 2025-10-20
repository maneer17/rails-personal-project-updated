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
        begin
          decoded = JsonWebToken.decode_token(token)
        rescue JWT::ExpiredSignature
          return nil
        end
        student?(decoded[:role]) ? Student.find(decoded[:user_id]) : Teacher.find(decoded[:user_id])
      else
        nil
      end
    end
    private
      def student?(role)
        role == "STUDENT"
      end
end
