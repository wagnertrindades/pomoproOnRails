require 'spec_helper'

describe 'Log in and View timer' do
    let!(:email){ "example@example.com" }
    let!(:password){ "example123" }

    context 'Enter in account' do
        it 'success' do
            sign_up(:email, :password)
            visit "/users/sign_in"
            fill_in "Email", with: :email
            fill_in "Password", with: :password
            click_button "Log in"

            expect(page).to have_content("Timer")
        end

        it 'error' do
            sign_up(:email, :password)
            visit "/users/sign_in"
            fill_in "Email", with: "errado@errado.com"
            fill_in "Password", with: "errado"
            click_button "Log in"

            expect(page).to_not have_content("Timer")
        end
    end
end