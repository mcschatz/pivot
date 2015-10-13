class WelcomeController < ApplicationController
  def index

  end

  def about
    @content = (AboutContent.new).generate
  end

  def give
    render :give
  end

  def contact

  end

end
