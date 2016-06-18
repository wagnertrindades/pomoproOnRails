require 'rails_helper'

RSpec.describe TimersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in :user, user }

  describe 'GET index' do

    it 'assigns @user' do
      get :index, user_id: user.id
      expect(assigns(:user)).to eq user
    end

    it 'assigns @timers' do
      timer = create(:timer, :user => user)
      get :index, user_id: user.id
      expect(assigns(:timers)).to eq [timer]
    end

    it 'assigns @timer' do
      get :index, user_id: user.id
      expect(assigns(:timer)).to be_an_instance_of Timer
    end

    it 'renders the index template' do
      get :index, user_id: user.id
      expect(response).to render_template("index")
    end

  end

  describe 'POST create' do

    it 'assigns @timer' do
      post :create, user_id: user.id, status: "pomo"
      expect(assigns(:timer)).to be_an_instance_of Timer
    end

    context "has save timer" do

      context "success" do

        it "renders user timers" do
          post :create, user_id: user.id, status: "pomo"
          expect(@reponse).to redirect_to user_timers_path
        end

        it "create timer" do
          post :create, user_id: user.id, status: "pomo"
          expect(user.timer).not_to be_empty
        end

      end

      context "failure" do

        before do
          allow_any_instance_of(Timer).to receive(:save).and_return false
        end

        it "renders a failure message" do
          post :create, user_id: user.id, status: "pomo"
          expect(flash[:error]).to eq "Problema em concluir timer."
        end

        it "renders user timers" do
          post :create, user_id: user.id, status: "pomo"
          expect(@response).to redirect_to user_timers_path
        end

      end

    end

  end
end
