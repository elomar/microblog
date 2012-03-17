# encoding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:session][:email])
    if usuario && user.authenticate(params[:session][:password])
      
    else
      flash[:alert] = "Usuário/senha inválidos!"
      render 'new'      
    end
  end
end
