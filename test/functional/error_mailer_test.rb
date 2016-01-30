require 'test_helper'

class ErrorMailerTest < ActionMailer::TestCase
  test "error_details" do
    mail = ErrorMailer.error_details
    assert_equal "Error details", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
