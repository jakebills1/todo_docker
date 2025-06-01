class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "I'm a job!"
  end
end
