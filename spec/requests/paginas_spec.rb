# encoding: utf-8

require 'spec_helper'

describe "Páginas" do
  describe "Inicial" do
    it "deve ter o conteúdo 'MicroBlog'" do
      visit "/paginas/index"
      page.should have_content("MicroBlog")
    end
  end

  describe "Ajuda" do
    it "deve ter o conteúdo 'Ajuda'" do
      visit "/paginas/ajuda"
      page.should have_content("Ajuda")
    end
  end

  describe "Sobre" do
    it "deve ter o conteúdo 'Sobre'" do
      visit "/paginas/sobre"
      page.should have_content("Sobre")
    end
  end
end
