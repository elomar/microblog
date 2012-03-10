require 'spec_helper'

describe Usuario do
  before { @usuario = Usuario.new(nome: "Exemplo Usuario", email: "usuario@exemplo.com") }

  subject { @usuario }

  it { should respond_to(:nome) }
  it { should respond_to(:email) }
end
