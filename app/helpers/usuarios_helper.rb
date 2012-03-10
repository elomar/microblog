module UsuariosHelper
  def gravatar_for(usuario)
    gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: usuario.nome, class: "gravatar")
  end
end
