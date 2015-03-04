class StaticPagesController < ApplicationController
  # Not using the before authenticate! action as it doesn't play nicely with rspec. So instead just write our own... simple.
  before_filter :require_login

  def index
    @login_status = "Logged In User"
    render "index"
  end

  def require_login
    unless user_signed_in?
      @login_status = "Not Logged In User"
      redirect_to url_for :controller => "devise/sessions", :action => "new"
    end
  end
end
