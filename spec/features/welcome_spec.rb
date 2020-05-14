require "rails_helper"

RSpec.feature "User sees the welcome page" do
    scenario "they see the welcome page" do
        page_title = "Two-Wheeled Buy & Sell"
        visit root_path
        expect(page).to have_text page_title
    end

    # scenario "they should be able to see the welcome logo" do
    #     visit root_path
    #     expect(page).to have_xpath("//img[@src='/Users/christopherbrum/Documents/Projects/TwoWheeledBS/app/assets/images/moto-man-final.png']")
    # end

    scenario "they should be able to see the sign in button" do
        page.has_button?('.sign-in-button')
    end

    scenario "they should be able to see the sign up button" do
        page.has_button?('.sign-up-button')
    end

    scenario "clicking the sign in button should link to the sign in page" do
        visit root_path
        click_on "Sign In"
        expect(page).to have_content('Log In')
    end
end