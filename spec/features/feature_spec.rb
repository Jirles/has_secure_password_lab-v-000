require 'rails_helper'

describe "Secure Password Lab App" do 
  context "user features" do 
    it 'takes users to the login page as the root path' do 
      visit root_path

      expect(page).to have_content("Login")
    end 

    it 'login page/root path also has a link to signup for new users' do 
      visit root_path 

      expect(page).to have_link("Signup")
    end 
  end 
  
end 
