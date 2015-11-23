require 'spec_helper'

describe 'Log in and View timer' do

    context 'Enter in account and sign out' do
        it 'success and go to home' do
            sign_in

            click_link "Sair"

            expect(page).to have_content("Log in")
        end
    end
end