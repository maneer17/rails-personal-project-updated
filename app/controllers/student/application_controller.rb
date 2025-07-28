class ApplicationController < ::ApplicationController
  # Mai: remove allow_browser , we have it in ::ApplicationController class
  allow_browser versions: :modern

  before_action :authenticate_student!

  # Mai What is this
  active_devise = current_student || current_teacher
end
