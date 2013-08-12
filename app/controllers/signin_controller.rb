class SigninController < ApplicationController
  def new
    @identity = env['omniauth.identity']
  end
end
