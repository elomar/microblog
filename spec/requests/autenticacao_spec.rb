# encoding: utf-8

require 'spec_helper'

describe "Autenticação" do

  subject { page }

  describe "página de login" do
    before { visit login_path }

    it { should have_selector('h1',    text: 'Entre no site') }
    it { should have_selector('title', text: 'Entre no site') }

    describe "com informação inválida" do
      before { click_button "Entre no site" }

      it { should have_selector('title', text: 'Entre no site') }
      it { should have_selector('p.alert', text: 'inválidos') }

      describe "depois de visitar outra página" do
        before { click_link "Início" }
        it { should_not have_selector('p.alert') }
      end
    end

    describe "com informação válida" do
      let(:usuario) { FactoryGirl.create(:usuario) }
      before do
        fill_in "Email", with: usuario.email
        fill_in "Senha", with: usuario.password
        click_button "Entre no site"
      end

      it { should have_selector('title', text: usuario.nome) }
      it { should have_link('Perfil', href: usuario_path(usuario)) }
      it { should have_link('Sair', href: logout_path) }
      it { should_not have_link('Entre no site', href: login_path) }

      describe "seguido de logout" do
        before { click_link "Sair" }
        it { should have_link('Entre no site') }
      end
    end
  end
end
