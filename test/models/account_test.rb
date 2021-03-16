require "test_helper"

class AccountTest < ActiveSupport::TestCase

  test 'associations can be made with out-of-scope objects (but should not!)' do
    # See acts_as_tenant:/spec/models/model_extensions.rb:194,
    # "associations can only be made with in-scope objects"
    room2 = accounts(:two).rooms.create!(name: 'Account 2 room')
    ActsAsTenant.current_tenant = accounts(:one)
    room1 = Room.create!(name: "Account 1 room")
    person = room1.people.create!(name: 'Account 1 person')
    person.room = room2
    refute person.valid? # This should pass, but it fails!
    refute person.update(room_id: room2.id) # This should pass, but it fails!
  end
end
