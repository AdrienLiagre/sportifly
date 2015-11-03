class RemindMessageJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    puts "Hi I'm performing the job #{user.name}"
    # Do something later
  end
end

