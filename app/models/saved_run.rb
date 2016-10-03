class SavedRun < ApplicationRecord
  belongs_to :app_user
  belongs_to :run
end
