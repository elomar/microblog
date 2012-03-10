# encoding: utf-8

require 'spec_helper'

describe "Usuarios" do
  subject { page }

  describe "profile page" do
    let(:usuario) { FactoryGirl.create(:usuario) }
    before { visit usuario_path(usuario) }

    it { should have_selector('h1',    text: usuario.nome) }
    it { should have_selector('title', text: usuario.nome) }
  end

  describe "página de signup" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Cadastre-se') }
    it { should have_selector('title', text: 'MicroBlog IT | Cadastre-se') }
  end
end
