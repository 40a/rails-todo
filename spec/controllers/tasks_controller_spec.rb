require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    FactoryGirl.create_list(:task, 3, status: :plan)
    FactoryGirl.create_list(:task, 2, status: :done)
  end

  describe 'GET #index' do
    subject { get :index }

    specify { expect(response).to have_http_status(:success) }
    specify { subject; expect(assigns[:tasks].size).to eq 5 }
  end

  describe 'GET #create' do
    subject { post :create, task: {name: 'test', description: 'test description'} }
    specify { expect(subject).to redirect_to action: 'index' }
    specify { expect { subject }.to change { Task.count }.by 1 }
  end
end
