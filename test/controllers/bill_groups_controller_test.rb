# frozen_string_literal: true

require 'test_helper'

class BillGroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bill_groups_index_url
    assert_response :success
  end

  test 'should get new' do
    get bill_groups_new_url
    assert_response :success
  end
end
