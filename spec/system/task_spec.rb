require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task, title:'task',content: 'aaa',daytime:'002020-10-08',endtime_at:'002020-10-07',status: 1, priority: 1)}
  let!(:task2) { FactoryBot.create(:task2, title:'task2',content: 'bbb',daytime:'002020-10-08',endtime_at:'002020-10-06',status: 2, priority: 3)}
  let!(:task3) { FactoryBot.create(:task3, title:'task3',content: 'ccc',daytime:'002020-10-08',endtime_at:'002020-10-10',status: 3, priority: 2)}
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[daytime]',with: '002020-10-07'
        fill_in 'task[title]', with: 'test_task55'
        # binding.irb
        fill_in 'task[content]', with: 'content_test55'
        # fill_in 'task[statuses_keys]', select: 1
        find("#task_status").find("option[value='着手']").select_option
        find("#task_priority").find("option[value='高']").select_option
        # fill_in 'task[endtime_at]', with: '002020-10-01'
        click_button '投稿する'
        # task = FactoryBot.create(:task,title: 'task')
        visit tasks_path
        # expect(page).to have_content '002020-10-07'
        expect(page).to have_content 'test_task55'
        expect(page).to have_content 'content_test55'
        expect(page).to have_content '着手'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # task = FactoryBot.create(:task,title: 'task',content: 'content')
        # task2 = FactoryBot.create(:task,title: 'task2',content: 'content2')
        visit tasks_path
        # タスクと２があるか
        # 一覧ペーいにいるいるか
        expect(tasks_path).to eq tasks_path
        # タスクが２つあるか
        expect(page).to have_content 'task'
        expect(page).to have_content 'task2'
        expect(page).to have_content 'task3'
        expect(page).to have_content 'aaa'
        expect(page).to have_content 'bbb'
        expect(page).to have_content 'ccc'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it 'タスクが作成日時の降順に並んでいること' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'task3'
      end
    end
    context 'タスク期限日時の降順に並んでいる場合' do
      it 'タスクが期限日時の降順に並んでいること' do
      visit tasks_path
      click_on '期限並び替え'
      sleep(0.5)
      task_list = all('.task_row')
      expect(task_list[1]).to have_content '2020-10-07'
    end
   end
   context '優先順位が高い順に並んでいる場合' do
    it '優先順位の高い順に並んでいること' do
      visit tasks_path
      click_on '優先順位で並び替え'
      sleep(0.5)
      priority_list = all('.task_row')
      expect(priority_list[1]).to have_content '中'
    end
  end      
 end
 describe '検索機能' do
   context 'タイトルで検索をかけた場合' do
    it '指定したタイトルのが表示されていること' do
      visit tasks_path
      fill_in 'search_title', with: 'task2'
      click_button '検索' 
      task_search = all('.task_row')
      expect(task_search[0]).to have_content 'task2'
    end
  end
  context 'status検索をかけた場合' do
    it '指定したstatusが表示されること' do
      visit tasks_path
      find("#search_status").find("option[value='着手']").select_option
      click_button '検索' 
      task_search = all('.task_row')
      expect(task_search[0]).to have_content '着手'
    end
  end
  context 'ステータス、タイトル両方検索された場合' do
    it '双方にマッチした内容のみを表示すること' do
      FactoryBot.create(:task2, title:'task2',content: 'bbb',daytime:'002020-10-08',endtime_at:'002020-10-06',status: 1)
      visit tasks_path
      fill_in 'search_title', with: 'task2'
      find("#search_status").find("option[value='着手']").select_option
      click_button '検索'
      status_title_search = all('.task_row')
      expect(status_title_search[0]).to have_content '着手'
      expect(status_title_search[0]).to have_content 'task2'
      expect(page).not_to have_content 'task1'
    end
  end
end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        # task = FactoryBot.create(:task,title: 'task_詳細',content: 'content_詳細')
        visit task_path(task.id)
        expect(task).to be_valid
       end
     end
  end 
end