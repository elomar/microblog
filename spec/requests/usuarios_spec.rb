# encoding: utf-8

require 'spec_helper'

describe "Usuarios" do
  subject { page }

  describe "página de signup" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Cadastre-se') }
    it { should have_selector('title', text: 'MicroBlog IT | Cadastre-se') }
  end
end
