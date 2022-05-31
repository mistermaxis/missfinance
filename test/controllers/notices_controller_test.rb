require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test 'should get success' do
    get notices_success_url
    assert_response :success
  end

  test 'should get failure' do
    get notices_failure_url
    assert_response :success
  end
end
