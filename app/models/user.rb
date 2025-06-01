class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  after_create_commit -> { HardJob.perform_async }
end
