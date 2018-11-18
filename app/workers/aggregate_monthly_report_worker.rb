class AggregateMonthlyReportWorker
  include Sidekiq::Worker
  sidekiq_options queue: :import, retry: false

  def perform(*args)
    year, month = Date.today.year, Date.today.month
    records = Record.aggregate_by_user
    records.each do |record|
      data = Record.import_data_by_user(record.user_id).to_json
      MonthlyReport.create!({
              user_id: record.user_id,
              data: data,
              total_hour: record.total_hour,
              total_days: record.total_days,
              average_hour: record.average_hour,
              period_month: month,
              period_year: year,
      })
    end
    last_year = Date.today.prev_year
    MonthlyReport.where("period_year <= ?",last_year.year).where("period_month <= ?", last_year.month).destroy_all
  end
end
