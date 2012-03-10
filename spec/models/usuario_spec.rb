# encoding: utf-8

require 'spec_helper'

describe Usuario do
  before { @usuario = Usuario.new(nome: "Exemplo Usuario", email: "usuario@exemplo.com") }

  subject { @usuario }

  it { should respond_to(:nome) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "quando nome está em branco" do
    before { @usuario.nome = " " }
    it { should_not be_valid }
  end

  describe "quando email está em branco" do
    before { @usuario.email = " " }
    it { should_not be_valid }
  end

  describe "quando nome é grande demais" do
    before { @usuario.nome = "a" * 51 }
    it { should_not be_valid }
  end

  describe "quando email é inválido" do
    emails_invalidos =  %w[usuario@foo,com usuario_at_foo.org example.usuario@foo.]
    emails_invalidos.each do |email_invalido|
      before { @usuario.email = email_invalido }
      it { should_not be_valid }
    end
  end

  describe "quando email é válido" do
    emails_validos = %w[usuario@foo.com A_usuario@f.b.org frst.lst@foo.jp a+b@baz.cn]
    emails_validos.each do |email_valido|
      before { @usuario.email = email_valido }
      it { should be_valid }
    end
  end

end
