require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event_valid){ Event.create(title: 'This is a valid title')}
  let(:event_invalid){ Event.create(title: 'Invalid')}
  
  describe 'validation' do 
    context 'event with valid title length' do
      before {event_valid}
      it 'is valid' do
        expect(event_valid.valid?).to be(true)
      end
    end

    context 'event with invalid title length' do
      before {event_invalid}
      it 'is invalid' do
        expect(event_invalid.valid?).to be(false)
      end
    end
  end

  # ----------------------------------------------------------
  # ----------------------------------------------------------

  describe 'associations' do 
    let(:user1){ User.create(name: 'Elijah') }
    let(:user2){ User.create(name: 'Lucas') }
    let(:event1){ user1.created_events.create(title: 'The first event') }
    let(:event2){ user1.created_events.create(title: 'The second event') }
    
    context 'User can create more than one event' do
      it 'is listed in user.created_events' do
        expect(user1.created_events).to include(event1,event2)
      end
    end

     context 'user can attend more than one event' do
      it 'is listed in user.attended_events' do
        user1.attended_events.push(event1,event2)
        expect(user1.attended_events).to include(event1,event2)
      end
    end

    context 'event can have one or more attendees' do
      it 'allows many attendees' do
        event1.attendees.push(user1,user2)
        expect(event1.attendees).to include(user1,user2)
      end

      it 'can allow one attendee' do
        event2.attendees.push(user2)
        expect(event2.attendees).to include(user2)
      end

    end
  end
end
