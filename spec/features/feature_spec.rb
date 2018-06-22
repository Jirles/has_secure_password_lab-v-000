require 'rails_helper'

describe "Secure Password Lab App" do
  context "user features" do
    it 'takes users to the login page as the root path' do
      visit root_path

      expect(page).to have_content("Login")
    end

    it 'login page has a form for users to login by providing their name, password, and a password confirmation' do
      visit root_path

      expect(page).to have_selector("form")
      expect(page).to have_field(:user_name)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
    end

    it 'login page/root path also has a link to signup for new users' do
      visit root_path

      expect(page).to have_link("Signup")
    end
  end

end
