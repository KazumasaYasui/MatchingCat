require 'test_helper'

class CatMailerTest < ActionMailer::TestCase
  test "send_when_complete" do
    mail = CatMailer.send_when_complete
    assert_equal "Send when complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
