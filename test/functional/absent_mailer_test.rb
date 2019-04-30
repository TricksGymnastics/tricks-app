require 'test_helper'

class AbsentMailerTest < ActionMailer::TestCase
  test "gym_notification" do
    mail = AbsentMailer.gym_notification
    assert_equal "Gym notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
