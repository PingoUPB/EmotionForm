class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def only_admin
    if current_user.admin
      true
    else
      redirect_to root_path, alert: "Nur Admins erlaubt."
      false
    end
  end
end
