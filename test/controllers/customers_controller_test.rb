require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get customers_new_url
    assert_response :success
  end

  test 'should get index' do
    get customers_index_url
    assert_response :success
  end

  test 'should get show' do
    get customers_show_url
    assert_response :success
  end

  test 'should get create' do
    get customers_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get customers_destroy_url
    assert_response :success
  end
end
