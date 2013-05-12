require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Essence Diamant France') }
  end

  describe "English page" do
    before { visit english_path }

    it { should have_content('Welcome to the Essence Diamant France website !') }
  end
end