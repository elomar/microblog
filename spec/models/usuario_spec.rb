# encoding: utf-8

require 'spec_helper'

describe Usuario do
  before do
     @usuario = Usuario.new(nome: "Exemplo Usuario", email: "usuario@exemplo.com",
                            password: "foobar", password_confirmation: "foobar")
  end

  subject { @usuario }

  it { should respond_to(:nome) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "quando nome está em branco" do
    before { @usuario.nome = " " }
    it { should_not be_valid }
  end

  describe "quando email está em branco" do
    before { @usuario.email = " " }
    it { should_not be_valid }
  end

  describe "quando senha está em branco" do
    before { @usuario.password = @usuario.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "quando senha não é igual a confirmação" do
    before { @usuario.password_confirmation = "diferente" }
    it { should_not be_valid }
  end

  describe "quando confirmação é nula" do
    before { @usuario.password_confirmation = nil }
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

  describe "quando email já está em uso" do
    before do
      usuario_mesmo_email = @usuario.dup
      usuario_mesmo_email.save
    end

    it { should_not be_valid }
  end

  describe "quando email já está em uso em maiúsculas" do
    before do
      usuario_mesmo_email = @usuario.dup
      usuario_mesmo_email.email = @usuario.email.upcase
      usuario_mesmo_email.save
    end

    it { should_not be_valid }
  end

  describe "quando a senha é muito curta" do
    before { @usuario.password = @usuario.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "método authenticate" do
    before { @usuario.save }
    let(:usuario_encontrado) { Usuario.find_by_email(@usuario.email) }

    describe "com senha correta" do
      it { should == usuario_encontrado.authenticate(@usuario.password) }
    end

    describe "com senha incorreta" do
      let(:usuario_senha_incorreta) { usuario_encontrado.authenticate("incorreta") }

      it { should_not == usuario_senha_incorreta }
      specify { usuario_senha_incorreta.should be_false }
    end
  end

  describe "remember token" do
    before { @usuario.save }
    its(:remember_token) { should_not be_blank }
  end
end
