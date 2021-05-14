FactoryBot.define do
  factory :task do
    daytime {'002020-10-06'}
    title {'タスク'}
    content {'コンテント'}
    endtime_at {'002020-10-07'}   
    status { 1 }
    priority { 1 }
  end
  factory :task2,class: Task do
    daytime {'002020-10-07'}
    title {'タスク2'}
    content {'コンテント2'}
    endtime_at {'002020-10-10'}
    status { 2 }
    priority { 2 }
  end
  factory :task3,class: Task do
    daytime {'002020-10-08'}
    title {'タスク3'}
    content {'コンテント3'}
    endtime_at {'002020-10-06'}
    status { 3 }
    priority { 3 }
  end
end

