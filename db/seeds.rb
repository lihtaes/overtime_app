20.times do |post|
  Post.create!(date: Date.today, rationale: "Because it gotta be done!#{post}")
end

puts "20 posts created"