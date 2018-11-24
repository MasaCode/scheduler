namespace :aggregate do
  task run: :environment do
    AggregateMonthlyReportWorker.perform_async
  end
end