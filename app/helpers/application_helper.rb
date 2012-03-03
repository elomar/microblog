module ApplicationHelper
  def titulo_completo(titulo)
    base = 'MicroBlog IT'
    if titulo.empty?
      base
    else 
      "#{base} | #{titulo}"
    end
  end
end
