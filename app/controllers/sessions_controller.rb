# encoding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:session][:email])
    if usuario && usuario.authenticate(params[:session][:password])
      login usuario
      redirect_to usuario      
    else
      flash.now[:alert] = "Usuário/senha inválidos!"
      render 'new'      
    end
  end
end
