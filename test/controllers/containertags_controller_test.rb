require 'test_helper'

class ContainertagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @containertag = containertags(:one)
  end

  test "should get index" do
    get containertags_url
    assert_response :success
  end

  test "should get new" do
    get new_containertag_url
    assert_response :success
  end

  test "should create containertag" do
    assert_difference('Containertag.count') do
      post containertags_url, params: { containertag: { container_id: @containertag.container_id, tag_id: @containertag.tag_id } }
    end

    assert_redirected_to containertag_url(Containertag.last)
  end

  test "should show containertag" do
    get containertag_url(@containertag)
    assert_response :success
  end

  test "should get edit" do
    get edit_containertag_url(@containertag)
    assert_response :success
  end

  test "should update containertag" do
    patch containertag_url(@containertag), params: { containertag: { container_id: @containertag.container_id, tag_id: @containertag.tag_id } }
    assert_redirected_to containertag_url(@containertag)
  end

  test "should destroy containertag" do
    assert_difference('Containertag.count', -1) do
      delete containertag_url(@containertag)
    end

    assert_redirected_to containertags_url
  end
end
