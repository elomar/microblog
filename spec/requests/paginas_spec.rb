# encoding: utf-8

require 'spec_helper'

describe "Páginas" do
  subject { page }

  describe "Inicial" do
    before { visit root_url }

    it { should have_content("MicroBlog") }
    it { should have_selector('title', text: "MicroBlog IT | Início") }
  end

  describe "Ajuda" do
    before { visit ajuda_url }

    it { should have_content("Ajuda") }
    it { should have_selector('title', text: "MicroBlog IT | Ajuda") }
  end

  describe "Sobre" do
    before { visit sobre_url }
    
    it { should visit(sobre_url) }
    it { should have_selector('title', text: "MicroBlog IT | Sobre") }
  end
end
