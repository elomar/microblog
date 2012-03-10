class UsuariosController < ApplicationController
  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
  end
end
