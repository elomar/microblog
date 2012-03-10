class UsuariosController < ApplicationController
  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to @usuario, notice: "Bem vindo ao site!"
    else
      render 'new'
    end
  end
end
