require 'faker'
FactoryBot.define do
  factory :team do
    
  end

  factory :banner do
    
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
    short_text { Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false) }
    full_text { Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false) }
    is_public { rand(0..1) }
    default_photo { "https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg" }
    # users_id: @users.sample.id,
    category
    user
  end

end