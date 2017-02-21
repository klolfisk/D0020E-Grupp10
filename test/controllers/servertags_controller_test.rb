require 'test_helper'

class ServertagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servertag = servertags(:one)
  end

  test "should get index" do
    get servertags_url
    assert_response :success
  end

  test "should get new" do
    get new_servertag_url
    assert_response :success
  end

  test "should create servertag" do
    assert_difference('Servertag.count') do
      post servertags_url, params: { servertag: { server_id: @servertag.server_id, tag_id: @servertag.tag_id } }
    end

    assert_redirected_to servertag_url(Servertag.last)
  end

  test "should show servertag" do
    get servertag_url(@servertag)
    assert_response :success
  end

  test "should get edit" do
    get edit_servertag_url(@servertag)
    assert_response :success
  end

  test "should update servertag" do
    patch servertag_url(@servertag), params: { servertag: { server_id: @servertag.server_id, tag_id: @servertag.tag_id } }
    assert_redirected_to servertag_url(@servertag)
  end

  test "should destroy servertag" do
    assert_difference('Servertag.count', -1) do
      delete servertag_url(@servertag)
    end

    assert_redirected_to servertags_url
  end
end
