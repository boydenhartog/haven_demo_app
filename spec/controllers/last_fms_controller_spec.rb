require 'rails_helper'

RSpec.describe LastFmsController, type: :controller do
	#include Devise::Test::ControllerHelpers
  describe '#show' do

    context 'User is logged in and #show' do
    	before do
    		user = create(:user)
    		sign_in user
    		get :show 
    	end

    	it { is_expected.to render_template(:show) }
    	
    	it 'LastFM should be initialized' do
    		expect(assigns(:last_fm)).to be_a(LastFm)
    	end
    end

    context 'user not logged in' do
    	before { get :show }
    	it { is_expected.to redirect_to(new_user_session_path) }
    end

  end
end
