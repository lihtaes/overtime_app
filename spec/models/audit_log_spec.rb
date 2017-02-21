#Audit log should be associated with the user.
#Status is a required field
#Start date is required
#Start date should be equal to six days prior

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do 
    @audit_log = FactoryGirl.create(:audit_log)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@audit_log).to be_valid
    end

    it 'should have a user associated with it' do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end    

    it 'should have a start date' do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should have a start date equal to six days prior' do
      new_audit_log = AuditLog.create(user_id: User.last.id)
      expect(new_audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end
