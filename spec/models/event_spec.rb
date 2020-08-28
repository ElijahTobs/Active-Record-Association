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
end
