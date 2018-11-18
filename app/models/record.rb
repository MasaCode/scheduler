class Record < ApplicationRecord
  belongs_to :user

  scope :aggregate_by_user, -> do
    select(["user_id", "SUM(worked_hour) AS total_hour", " COUNT(id) AS total_days", " AVG(worked_hour) AS average_hour"]).group(:user_id)
  end
  scope :import_data_by_user, -> (user_id) { where(user_id: user_id).select('record_date', 'worked_hour') }
end
