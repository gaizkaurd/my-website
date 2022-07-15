FactoryBot.define do
  factory :proyect do
    name { 'MyString' }
    description { 'MyString' }
    content { 'This is my main project!' }
    repo { 'https://github.com/gaizkaurd/my-website' }
    start_time { '2022-07-15 11:41:04' }
    end_time { '2022-07-15 11:41:04' }
    active { false }
  end
end
