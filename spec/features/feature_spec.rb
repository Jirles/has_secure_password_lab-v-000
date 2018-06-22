require 'rails_helper'

describe "Secure Password Lab App" do
  context "app pages" do
    it 'the root page is the login page' do
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

    it 'the signup page has a form for users to login by providing their name, password, and a password confirmation' do
      visit signup_path

      expect(page).to have_selector("form")
      expect(page).to have_field(:user_name)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
    end

    it 'the welcome page greets the user and has a button to logout if the user is logged in' do
      User.create(name: "Calypso", password: "i'macat", password_confirmation: "i'macat")
      visit root_path
      fill_in :user_name, with: "Calypso"
      fill_in :user_password, with: "i'macat"
      fill_in :user_password_confirmation, with: "i'macat"
      click_button "Submit"

      expect(page.current_path).to include("/welcome")
      expect(page.body).to include("Welcome, Calypso")
      expect(page).to have_button("Logout")
    end
  end

end
