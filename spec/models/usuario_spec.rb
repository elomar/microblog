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
end
