module Auth
  module Students
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_sign_up_params, only: [ :create ]
      before_action :configure_account_update_params, only: [ :update ]
      def new
        super
      end
      def create
        super
        Rails.logger.debug params.inspect
      end
      def edit
        super
      end
      def update
        super
      end
    def destroy
      super
    end
    def cancel
      super
    end

    protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    end
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
    end
    def after_sign_up_path_for(resource)
      super(resource)
    end
    def after_inactive_sign_up_path_for(resource)
      super(resource)
    end
    end
  end
end

    private
      def after_confirmation_path_for(resource_name, resource)
        super(resource_name, resource)
      end
