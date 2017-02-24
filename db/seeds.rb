AdminUser.create(email: "admin@test.com", password: "password", password_confirmation: "password", first_name: "Jamie", last_name: "Lannister", phone: "5551234444")

puts "1 Admin User created"

@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow", phone: "5556667777")

puts "1 user created
"
20.times do |post|
  Post.create!(date: Date.today, rationale: "Because it gotta be done!#{post}", user_id: @user.id, overtime_request: 2.5)
end

puts "10 posts created"

30.times do |audit_log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end
  puts "10 audit logs created"