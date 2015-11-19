require 'spec_helper'

describe 'Log in and View timer' do
    let!(:user){ User.create(email: "example@example.com", password: "example123") }

    context 'Enter in account' do
        it 'success' do
            visit "/"
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            click_button "Log in"

            expect(page).to have_content("Timer")
        end

        it 'error' do
            visit "/"
            fill_in "Email", with: "errado@errado.com"
            fill_in "Password", with: "errado"
            click_button "Log in"

            expect(page).to_not have_content("Timer")
        end
    end
end