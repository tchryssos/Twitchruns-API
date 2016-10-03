class AppUser < ApplicationRecord
  has_secure_password
  has_many :saved_runs
end
