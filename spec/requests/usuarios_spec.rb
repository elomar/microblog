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

  describe "cadastro" do 
    before { visit signup_path }

    describe "com informação inválida" do
      it "não deve criar usuário" do
        expect { click_button "Criar minha conta" }.not_to change(Usuario, :count)
      end
    end

    describe "com informação válida" do
      before do
        fill_in "Nome",               with: "Exemplo"
        fill_in "Email",              with: "usuario@exemplo.com"
        fill_in "Senha",              with: "123456"
        fill_in "Confirme sua senha", with: "123456"
      end

      it "deve criar usuário" do
        expect { click_button "Criar minha conta" }.to change(Usuario, :count).by(1)
      end

      describe "ao se cadastrar" do
        before { click_button "Criar minha conta" }
        it { should have_link('Sair') }
      end
    end
  end
end
