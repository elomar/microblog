class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logado?, :usuario_logado

  protected

    def login(usuario)
      cookies.permanent[:remember_token] = usuario.remember_token
      @usuario_logado = usuario
    end

    def logado?
      usuario_logado.present?
    end

    def usuario_logado
      @usuario_logado ||= usuario_com_remember_token
    end

    def usuario_com_remember_token
      remember_token = cookies[:remember_token]
      Usuario.find_by_remember_token(remember_token) unless remember_token.nil?
    end
end
