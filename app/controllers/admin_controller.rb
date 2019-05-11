class AdminController < ApplicationController
  def index
    redirect_to users_url
  end
end
