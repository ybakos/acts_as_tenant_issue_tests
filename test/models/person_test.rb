require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test 'prove it' do
    ActsAsTenant.with_tenant(accounts(:one)) do
      person = people(:one)
      assert person.account == accounts(:one)
      assert person.valid?
      first_room = rooms(:one)
      assert first_room.account == accounts(:one)
      assert person.room == first_room

      second_room = rooms(:two)
      refute first_room.account == second_room.account
      refute person.account == second_room.account
      person.room = second_room # person's account is not the same as second_room's account

      refute person.valid? # This should pass, but it fails.
      refute person.save # This should pass, but it fails.
      assert_raises(ActiveRecord::RecordInvalid) { person.save! } # This should pass, but it fails.
    end
  end
end
