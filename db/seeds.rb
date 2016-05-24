# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create(:task, name: 'タスク１', description: 'タスク１です。', status: :plan)
FactoryGirl.create(:task, name: 'タスク２', description: 'タスク２です。', status: :plan)
FactoryGirl.create(:task, name: 'タスク３', description: '完了済みタスクです。', status: :done)
