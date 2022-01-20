require 'test_helper'

class RecepisControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get recepis_new_url
    assert_response :success
  end

  test 'should get index' do
    get recepis_index_url
    assert_response :success
  end

  test 'should get show' do
    get recepis_show_url
    assert_response :success
  end

  test 'should get create' do
    get recepis_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get recepis_destroy_url
    assert_response :success
  end
end
