# encoding: utf-8

require 'spec_helper'

describe "Páginas" do
  describe "Inicial" do
    it "deve ter o conteúdo 'MicroBlog'" do
      visit root_url
      page.should have_content("MicroBlog")
    end

    it "Deve ter o título 'Início'" do
      visit root_url
      page.should have_selector('title', text: "MicroBlog IT | Início")
    end
  end

  describe "Ajuda" do
    it "deve ter o conteúdo 'Ajuda'" do
      visit ajuda_url
      page.should have_content("Ajuda")
    end

    it "Deve ter o título 'Ajuda'" do
      visit ajuda_url
      page.should have_selector('title', text: "MicroBlog IT | Ajuda")
    end
  end

  describe "Sobre" do
    it "deve ter o conteúdo 'Sobre'" do
      visit sobre_url
      page.should have_content("Sobre")
    end

    it "Deve ter o título 'Sobre'" do
      visit sobre_url
      page.should have_selector('title', text: "MicroBlog IT | Sobre")
    end
  end
end
