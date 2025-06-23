class PagesController < ApplicationController
  before_action :authenticate_user!, only: :secret
  def home
  end

  def secret
    #redirect_to root_path unless user_signed_in?
  end
end
