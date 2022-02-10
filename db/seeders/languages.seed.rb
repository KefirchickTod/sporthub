Language.delete_all

3.times do
  Language.create(
    title: Faker::Address.unique.country,
    status: false
  )
end
