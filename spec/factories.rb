require "faker"
FactoryBot.define do
  factory :role do
    name { Faker::ProgrammingLanguage.name }
  end

  factory :social_network_placement, class: "Social::NetworkPlacement" do
  end

  factory :social_network, class: "Social::Network" do
  end

  factory :footer do
  end

  factory :banner do
  end

  factory :language do
  end

  factory :survey_answer do
  end

  factory :survey_option do
  end

  factory :survey do
  end

  factory :country do
    title { Faker::Address.country }
  end

  factory :team do
    title { Faker::Sports::Football.team }
    sub_category_id { category.id }
    country
    category
  end

  factory(:user) do
    first_name { Faker::Internet.email }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  factory(:category) do
    title { "#{Faker::Book.title}#{rand(0..2523234)}" }
  end
  factory(:article) do
    title { "#{Faker::Book.title}#{rand(0..2523234)}" }
    content { Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false) }
    caption { Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false) }
    is_public { true }
    show_comment { true }
    # users_id: @users.sample.id,
    category
    user
    team
    country
  end
end
