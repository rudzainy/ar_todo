require 'faker'

10.times do
	List.create(
		item: Faker::Lorem.sentence,
		status: [true, false].sample
		)
end