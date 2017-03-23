class WelcomeController < ApplicationController
  def hello

  end

  def version
    @version = '0.0.1'
    version = '0.0.2'
  end

  def index
  end
end
