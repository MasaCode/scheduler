FactoryBot.define do
  factory :record do
    sequence(:start_at) { |i| default_start_at + (i - 1).day }
    sequence(:end_at) { |i| default_end_at + (i - 1).day }
    sequence(:record_date) { |i| default_record_date + (i - 1).day }
    worked_hour { default_worked_hour }
    user { default_user }

    transient do
      default_start_at { DateTime.now }
      default_end_at { DateTime.now + 1.hour }
      default_record_date { Date.today }
      default_worked_hour { 1 }
      default_user { create(:user) }
    end
  end
end
