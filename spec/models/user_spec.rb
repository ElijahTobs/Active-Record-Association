require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Capybara') }
  let(:user1) { User.create(name: 'Capybara') }
  let(:user2) { User.create(name: '') }

  describe 'validation' do
    context 'a user with a unique name' do
      before { user }
      it 'is valid' do
        expect(user.valid?).to be(true)
      end
    end

    context 'a user with a duplicated name' do
      it 'is invalid' do
        user
        user2
        expect(user1.valid?).to be(false)
      end
    end

    context 'a user without a name' do
      before { user2 }
      it 'is invalid' do
        expect(user2.valid?).to be(false)
      end
    end
  end

  describe 'associations' do
    let(:event) { user.created_events.create(title: 'This is a valid title') }

    context 'event created by user' do
      before { user }
      it 'is listed in user.created_events' do
        expect(user.created_events).to include(event)
      end
    end

    context 'event attended by user' do
      it 'is listed in user.attended_events' do
        user
        event
        event.attendees.push(user)
        expect(user.attended_events).to include(event)
      end
    end
  end
end
