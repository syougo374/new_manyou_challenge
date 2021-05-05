FactoryBot.define do
  factory :task do
    daytime {'002020-10-06'}
    title {'タスク'}
    content {'コンテント'}
  end
  factory :task2,class: Task do
    daytime {'002020-10-07'}
    title {'タスク2'}
    content {'コンテント2'}
  end
  factory :task3,class: Task do
    daytime {'002020-10-08'}
    title {'タスク3'}
    content {'コンテント3'}
  end
end
