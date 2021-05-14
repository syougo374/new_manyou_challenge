require 'rails_helper'

describe 'タスクモデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  before do
    FactoryBot.create(:task,user: user)
    FactoryBot.create(:task2,user: user)
    FactoryBot.create(:task3,user: user)
    # visit new_session_path
    # fill_in 'session[email]',with: 'syougo@docomo.ne.jp'
    # fill_in 'session[password]',with: 'password'
    # click_button 'Log in'
  end
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        # binding.irb
        task = Task.new(daytime:'002020-10-06', title: '', content: '失敗テスト', user: user)
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(daytime:'002020-10-06',title:'失敗テスト',content:'', user: user)
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        # user = FactoryBot.create(:user2)
        # binding.irb
        task = Task.new(title:'task',content: 'aaa',daytime:'002020-10-08',endtime_at:'002020-10-07',status: 1, priority: 1, user: user)
        expect(task).to be_valid
      end
    end
  end
end