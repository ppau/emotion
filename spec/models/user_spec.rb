require 'spec_helper'

describe 'User' do
  subject(:user){ FactoryGirl.build(:user) }

  it 'should permit "admin" as a role' do
    FactoryGirl.build(:user, role: 'admin').should be_valid
  end

  it 'should not permit "amin" as a role' do
    FactoryGirl.build(:user, role: 'amin').should_not be_valid
  end
end
