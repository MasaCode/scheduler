require File.expand_path(File.dirname(__FILE__) + "/environment")

set :output, "#{Rails.root}/log/cron.log"
set :environment, :development

every '15 1 1 * *' do
  rake 'aggregate:run'
end