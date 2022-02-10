
Survey.delete_all

10.times do
  Survey.create(
    question: Faker::Games::ElderScrolls.weapon + '?',
    active_from: DateTime.now.strftime('%Y-%m-%d'),
    active_to: Date.today.at_beginning_of_month.next_month.next_month.strftime('%Y-%m-%d'),
    status: rand(0..2)
  )
end
