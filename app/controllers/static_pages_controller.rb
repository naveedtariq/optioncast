class StaticPagesController < ApplicationController
  def home
  end

  def free_sign_up
    @user = User.new
  end
end
