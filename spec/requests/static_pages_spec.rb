require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Essence Diamant France') }

    it { should have_content('Les façons vagues, métaphoriques ou poétiques') }
    it { should_not have_content('The vague, metaphoric, or poetic') }

    it { should have_content("Rejoignez la communauté Facebook d'Essence Diamant France:") }
    it { should_not have_content('Join the Essence Diamant Facebook Group:') }
  end

  describe "English page" do
    before { visit english_path }

    it { should have_content('Welcome to the Essence Diamant France website!') }
    
    it { should have_content('The vague, metaphoric, or poetic') }
    it { should_not have_content('Les façons vagues, métaphoriques ou poétiques') }
  
    it { should have_content('Join the Essence Diamant Facebook Group:') }
    it { should_not have_content("Rejoignez la communauté Facebook d'Essence Diamant France:") }
  end

  describe "L'Approche Diamant page" do
    before { visit lapproche_diamant_path }

    it { should have_content('L’Approche Diamant est un enseignement contemporain apparu dans un') }

    it { should have_content('Les façons vagues, métaphoriques ou poétiques') }
    it { should_not have_content('The vague, metaphoric, or poetic') }

    it { should have_content("Rejoignez la communauté Facebook d'Essence Diamant France:") }
    it { should_not have_content('Join the Essence Diamant Facebook Group:') }
  end

  describe "Hameed L'Enseignant" do
    before { visit hameed_lenseignant_path }

    it { should have_content('Pourquoi avez-vous appelé votre enseignement L’Approche Diamant et non la Voie du Diamant ?') }

    it { should have_content('Les façons vagues, métaphoriques ou poétiques') }
    it { should_not have_content('The vague, metaphoric, or poetic') }

    it { should have_content("Rejoignez la communauté Facebook d'Essence Diamant France:") }
    it { should_not have_content('Join the Essence Diamant Facebook Group:') }
  end

  describe "La Collecte du Miel" do
    before { visit la_collecte_du_miel_path }

    it { should have_content('Il existait, et peut-être existe-t-il toujours, une école secrète en Afghanistan') }

    it { should have_content('Les façons vagues, métaphoriques ou poétiques') }
    it { should_not have_content('The vague, metaphoric, or poetic') }

    it { should have_content("Rejoignez la communauté Facebook d'Essence Diamant France:") }
    it { should_not have_content('Join the Essence Diamant Facebook Group:') }
  end
end