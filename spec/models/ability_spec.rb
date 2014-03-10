require 'spec_helper'
require 'cancan/matchers'

describe 'Ability' do
  subject(:ability){ Ability.new(user) }

  let(:user) { nil }

  context 'given an admin' do
    let(:user) { User.new(role: 'admin') }
    it { should be_able_to(:manage, Group.new) }
    it { should be_able_to(:manage, User.new) }
  end

  context 'given a regular user' do
    let(:user) { User.new(role: nil) }
    it { should_not be_able_to(:manage, User.new) }
    it { should_not be_able_to(:manage, Group.new) }
  end

  context 'given a member of a group' do
    let(:user){ User.create(role: nil, groups: [their_group]) }
    let(:their_motion){ Motion.create(name: 'their motion', text: '123') }
    let(:other_motion){ Motion.create(name: 'other motion', text: '123') }
    let(:their_group){ Group.create(name: 'their group', motions: [their_motion]) }
    let(:other_group){ Group.create(name: 'other group', motions: [other_motion]) }

    it 'should only permit reading their groups' do
      ability.should be_able_to(:read, their_group)
      ability.should_not be_able_to(:read, other_group)
    end

    it 'should only permit reading their groups' do
      ability.should be_able_to(:read, their_motion)
      ability.should_not be_able_to(:read, other_motion)
    end
  end
end
