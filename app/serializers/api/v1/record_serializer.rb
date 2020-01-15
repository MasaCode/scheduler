module Api
  module V1
    class RecordSerializer < Api::BaseSerializer
      attributes :id, :user_id, :record_date, :start_at, :end_at, :worked_hour
    end
  end
end
