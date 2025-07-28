class ApplicationController < ::ApplicationController
  # Mai: remove allow_browser , we have it in ::ApplicationController class
  allow_browser versions: :modern

  before_action :authenticate_teacher!
end
