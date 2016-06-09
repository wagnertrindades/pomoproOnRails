require 'rails_helper'

RSpec.describe TimersController, type: :controller do

  describe 'GET index' do
    let(:user) { create(:user) }

    before { sign_in :user, user }

    it 'assigns @user' do
      get :index, user_id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns @timers' do
      timer = create(:timer, :user => user)
      get :index, user_id: user.id
      expect(assigns(:timers)).to eq([timer])
    end

    it 'renders the index template' do
      get :index, user_id: user.id
      expect(response).to render_template("index")
    end

  end

  describe 'POST create'
end
