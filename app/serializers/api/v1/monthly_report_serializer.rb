module Api
  module V1
    class MonthlyReportSerializer
      attributes :id, :user_id, :data, :total_hour, :total_days, :average_hour, :period_month, :period_year
    end
  end
end
