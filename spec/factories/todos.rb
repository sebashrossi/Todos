FactoryBot.define do
  factory :todo do
    name { 'MyString' }
    status { 1 }
    user { nil }
  end
end
