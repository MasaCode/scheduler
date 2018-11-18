require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'Model' do
    it 'is valid with factory creation' do
      expect(build(:record)).to be_valid
    end

    it 'should have user association' do
      is_expected.to belong_to(:user)
    end
  end

  describe 'scope' do
    let!(:user) { create(:user) }
    let!(:records) { create_list(:record, 10, user: user) }

    it { expect(Record).to respond_to :aggregate_by_user }
    it { expect(Record).to respond_to :import_data_by_user }

    it 'aggregate_by_user' do
      data = Record.aggregate_by_user.first
      expect(data.total_hour).to eq 10
      expect(data.total_days).to eq 10
      expect(data.average_hour).to eq 1
    end

    it 'import_data_by_user' do
      data = Record.import_data_by_user(user.id)
      expect(data.length).to eq 10
      expect(data.first.attributes).to include("record_date")
      expect(data.first.attributes).to include("worked_hour")
    end
  end
end
