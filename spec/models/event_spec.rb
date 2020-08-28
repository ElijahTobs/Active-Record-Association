require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user){ User.create(name: 'Elijah') } 
  let(:user2){ User.create(name: 'Lucas') }
  
  describe 'validation' do 
    let(:event_valid){ user.created_events.create(title: 'This is a valid title')}
    let(:event_invalid){ user.created_events.create(title: 'Invalid')}
  
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

  describe 'associations' do
    let(:event){ user.created_events.create(title: 'Event from user') }
    
    context 'user that creates an event' do
      before {event}
      it 'is listed in event.creator' do
        expect(event.creator).to eql(user)
      end
    end

     context 'user that attends event' do
      before {event}
      it 'is listed in event.attendees' do
        user.attended_events.push(event)
        expect(event.attendees).to include(user)
      end
    end
  end


  describe 'many-to-many relations' do 
    let(:event11){ user.created_events.create(title: 'The first event from user') }
    let(:event12){ user.created_events.create(title: 'The second event from user') }
    let(:event21){ user2.created_events.create(title: 'The first event from user2') }
    let(:event22){ user2.created_events.create(title: 'The second event from user2') }
    
    context 'User can create more than one event' do
      it 'is listed in user.created_events' do
        expect(user.created_events).to include(event11,event12)
      end
    end

     context 'user can attend more than one event' do
      it 'is listed in user.attended_events' do
        user.attended_events.push(event21,event22)
        expect(user.attended_events).to include(event21,event22)
      end
    end

    context 'event can have one or more attendees' do
      it 'allows many attendees' do
        event11.attendees.push(user,user2)
        expect(event11.attendees).to include(user,user2)
      end

      it 'can allow one attendee' do
        event12.attendees.push(user2)
        expect(event12.attendees).to include(user2)
      end
    end
  end
end
