class WelcomeController < ApplicationController
  def landing
    redirect_to '/intro/index'
  end
end
