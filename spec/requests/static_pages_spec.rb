require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do

    it "should have the content 'Essence Diamant France'" do
    	visit '/static_pages/home'
    	expect(page).to have_content('Essence Diamant France')
    end

    it "should have the base title" do
    	visit '/static_pages/home'
    	expect(page).to have_title("Essence Diamant")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
end