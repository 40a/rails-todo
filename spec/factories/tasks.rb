FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task ##{n}" }
    sequence(:description) { |n| "Description ##{n}" }
    status 'plan'
  end
end
