require 'spec_helper'

describe 'Log in and View timer' do

    context 'Enter in account' do
        it 'success' do
            sign_in

            expect(page).to have_content("Timer")
        end

        it 'error' do
            visit "/"
            fill_in "Email", with: "errado@errado.com"
            fill_in "Password", with: "errado"
            click_button "Entrar"

            expect(page).to_not have_content("Timer")
        end
    end
end
