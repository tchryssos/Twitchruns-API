class SavedRun < ApplicationRecord
  belongs_to :user
  belongs_to :run
end
