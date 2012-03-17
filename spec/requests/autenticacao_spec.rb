# encoding: utf-8

require 'spec_helper'

describe "Autenticação" do

  subject { page }

  describe "página de login" do
    before { visit login_path }

    it { should have_selector('h1',    text: 'Entre no site') }
    it { should have_selector('title', text: 'Entre no site') }
  end
end
