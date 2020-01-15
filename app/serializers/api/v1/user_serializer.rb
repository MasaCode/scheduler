module Api
  module V1
    class UserSerializer < Api::BaseSerializer
      attributes :id, :name, :email, :target_hour, :check_in_period, :brewk_hour
      has_many :records
      has_many :monthly_reports

      attribute :auth_token do
        @instance_options[:auth_token]
      end
    end
  end
end
