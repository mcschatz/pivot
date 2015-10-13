class IdentitiesController < ApplicationController

  def new
    @identity = env['omniauth.identity']
  end

  def create

  end

end
