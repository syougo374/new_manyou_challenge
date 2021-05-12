require 'rails_helper'

describe 'タスクモデル機能', type: :model do
  before do
    @user = FactoryBot.create(:user,name:'鶴野',email:'syougo11111@docomo.ne.jp',password:'password',admin:'管理者')
    @task = FactoryBot.create(:task, title:'task',content: 'aaa',daytime:'002020-10-08',endtime_at:'002020-10-07',status: 1, priority: 1)
  end

  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        # binding.irb
        task = Task.new(daytime:'002020-10-06', title: '', content: '失敗テスト', user: @user)
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(daytime:'002020-10-06',title:'失敗テスト',content:'', user: @user)
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        # user = FactoryBot.create(:user2)
        # binding.irb
        task = Task.new(title:'task',content: 'aaa',daytime:'002020-10-08',endtime_at:'002020-10-07',status: 1, priority: 1, user: @user)
        expect(task).to be_valid
      end
    end
  end
end