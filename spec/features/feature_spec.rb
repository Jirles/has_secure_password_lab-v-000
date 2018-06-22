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
      visit '/signup'

      expect(page).to have_selector("form")
      expect(page).to have_field(:user_name)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
    end

    it 'the welcome page greets the user and has a button to logout' do 
      caly = User.create(name: "Calypso", password: "i'macat", password_confirmation: "i'macat")
      params = {user: {name: "Calypso", password: "i'macat", password_confirmation: "i'macat"}}
      post '/login', params 

      follow_redirect!
      expect(last_response.body).to include("Welcome, Caly")
    end 
  end

end
