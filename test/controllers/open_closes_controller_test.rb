require 'test_helper'

class OpenClosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_close = open_closes(:one)
  end

  test "should get index" do
    get open_closes_url
    assert_response :success
  end

  test "should get new" do
    get new_open_close_url
    assert_response :success
  end

  test "should create open_close" do
    assert_difference('OpenClose.count') do
      post open_closes_url, params: { open_close: { name: @open_close.name } }
    end

    assert_redirected_to open_close_url(OpenClose.last)
  end

  test "should show open_close" do
    get open_close_url(@open_close)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_close_url(@open_close)
    assert_response :success
  end

  test "should update open_close" do
    patch open_close_url(@open_close), params: { open_close: { name: @open_close.name } }
    assert_redirected_to open_close_url(@open_close)
  end

  test "should destroy open_close" do
    assert_difference('OpenClose.count', -1) do
      delete open_close_url(@open_close)
    end

    assert_redirected_to open_closes_url
  end
end
