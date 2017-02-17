class WelcomeController < ApplicationController
  def index
  	@users = User.all
  end
  def map
  	@users = User.all
  end
end
