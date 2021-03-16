require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test 'acts_as_tenant: ensure all models in an association belong to the same tenant' do
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

      refute person.valid? # This now passes, and it should.
      refute person.save # This now passes, and it should.
      assert_raises(ActiveRecord::RecordInvalid) { person.save! } # This now passes, and it should.
    end
  end
end
