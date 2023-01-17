FactoryBot.define do
  factory :anniversary do
    anniversary_name          {Faker::Lorem.word}
    anniversary_date          {Faker::Date.between(from: '1980-01-01', to: Date.today.next_year)}
    anniversary_description   {Faker::Lorem.word}
    category_id               {Category.ids[2]}
    who_anniversary           {Faker::Name.name}
    association :user
  end
end