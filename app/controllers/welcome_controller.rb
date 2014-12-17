class WelcomeController < ApplicationController
  #before_action :authenticate_user!

  caches_page :index

  def index
    render layout: false
    #@user = current_user
  end
end
