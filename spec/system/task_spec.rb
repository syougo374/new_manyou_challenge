require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  before do
    FactoryBot.create(:task,user: user)
    FactoryBot.create(:task2,user: user)
    FactoryBot.create(:task3,user: user)
    visit new_session_path
    fill_in 'session[email]',with: 'syougo@docomo.ne.jp'
    fill_in 'session[password]',with: 'password'
    click_button 'Log in'
  end
  
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        click_button 'タスクを追加する'
        fill_in 'task[daytime]',with: '002020-10-07'
        fill_in 'task[title]', with: 'test_task55'
        fill_in 'task[content]', with: 'content_test55'
        find("#task_status").find("option[value='着手']").select_option
        find("#task_priority").find("option[value='高']").select_option
        click_button '投稿する'
        expect(page).to have_content 'test_task55'
        expect(page).to have_content 'content_test55'
        expect(page).to have_content '着手'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        
        expect(current_path).to eq "/tasks"
        expect(page).to have_content 'タスク'
        expect(page).to have_content 'タスク2'
        expect(page).to have_content 'タスク3'
        expect(page).to have_content 'コンテント'
        expect(page).to have_content 'コンテント2'
        expect(page).to have_content 'コンテント3'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it 'タスクが作成日時の降順に並んでいること' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'タスク3'
      end
    end
    context 'タスク期限日時の降順に並んでいる場合' do
      it 'タスクが期限日時の降順に並んでいること' do
        # binding.irb
        click_on '期限並び替え'
      sleep(0.5)
      task_list = all('.task_row')
      expect(task_list[0]).to have_content '2020-10-10'
    end
   end
   context '優先順位が高い順に並んでいる場合' do
    it '優先順位の高い順に並んでいること' do

      click_on '優先順位で並び替え'
      sleep(0.5)
      priority_list = all('.task_row')
      expect(priority_list[2]).to have_content '低'
    end
  end      
 end
 describe '検索機能' do
   context 'タイトルで検索をかけた場合' do
    it '指定したタイトルのが表示されていること' do
      fill_in 'search_title', with: 'タスク2'
      click_button '検索' 
      task_search = all('.task_row')
      expect(task_search[0]).to have_content 'タスク'
    end
  end
  context 'status検索をかけた場合' do
    it '指定したstatusが表示されること' do
      find("#search_status").find("option[value='着手']").select_option
      click_button '検索' 
      task_search = all('.task_row')
      expect(task_search[0]).to have_content '着手'
    end
  end
  context 'ステータス、タイトル両方検索された場合' do
    it '双方にマッチした内容のみを表示すること' do
      fill_in 'search_title', with: 'タスク3'
      find("#search_status").find("option[value='完了']").select_option
      click_button '検索'
      status_title_search = all('.task_row')
      expect(status_title_search[0]).to have_content '完了'
      expect(status_title_search[0]).to have_content 'タスク3'
    end
  end
end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        first('tr td:nth-child(7)').click
        expect(page).to have_content '2020-10-08 00:00:00 +0900'
        expect(page).to have_content 'タスク3'
        expect(page).to have_content 'コンテント3'
        expect(page).to have_content '完了'
        expect(page).to have_content '高'   
       end
     end
  end 
end