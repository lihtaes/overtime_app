namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime if neccessary"
  task sms: :environment do
    puts "I'm in a rake task"
  end

end
