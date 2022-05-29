require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bills_index_url
    assert_response :success
  end

  test 'should get new' do
    get bills_new_url
    assert_response :success
  end
end
