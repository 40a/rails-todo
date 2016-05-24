require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    FactoryGirl.create_list(:task, 3, status: :plan)
    FactoryGirl.create_list(:task, 2, status: :done)
  end

  describe '.plan' do
    subject { Task.plan }
    specify { expect(subject.size).to eq 3 }
    specify { expect(subject.all?(&:plan?)).to eq true }
  end

  describe '.done' do
    subject { Task.done }
    specify { expect(subject.size).to eq 2 }
    specify { expect(subject.all?(&:done?)).to eq true }
  end

  describe '#plan?' do
    let(:plan_task) { Task.where(status: 'plan').first }
    let(:done_task) { Task.where(status: 'done').first }

    specify { expect(plan_task).to be_plan }
    specify { expect(done_task).to_not be_plan }
  end

  describe '#done?' do
    let(:plan_task) { Task.where(status: 'plan').first }
    let(:done_task) { Task.where(status: 'done').first }

    specify { expect(plan_task).to_not be_done }
    specify { expect(done_task).to be_done }
  end
end
