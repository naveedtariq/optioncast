class WelcomeController < ApplicationController
  #before_action :authenticate_user!

  def index
    render layout: false
    #@user = current_user
  end
end
