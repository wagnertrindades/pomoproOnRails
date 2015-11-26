require 'spec_helper'

describe 'All actions in the index timer' do

    context 'Funcionality of the timer' do
        it 'Add pomodoro' do
            sign_in

            click_button "Pomodoro"

            expect(Timer.count).to eq(1)
            expect(page.all(".list-pomos li").size).to eq(1)
        end

        it 'Add break' do
            sign_in

            click_button "Break"

            expect(Timer.count).to eq(1)
            expect(page.all(".list-breaks li").size).to eq(1)
        end

        it 'Add long break' do
            sign_in

            click_button "Long Break"

            expect(Timer.count).to eq(1)
            expect(page.all(".list-long-breaks li").size).to eq(1)
        end

    end
end