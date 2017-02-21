require 'test_helper'

class ServerhascontainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serverhascontainer = serverhascontainers(:one)
  end

  test "should get index" do
    get serverhascontainers_url
    assert_response :success
  end

  test "should get new" do
    get new_serverhascontainer_url
    assert_response :success
  end

  test "should create serverhascontainer" do
    assert_difference('Serverhascontainer.count') do
      post serverhascontainers_url, params: { serverhascontainer: { container_id: @serverhascontainer.container_id, server_id: @serverhascontainer.server_id } }
    end

    assert_redirected_to serverhascontainer_url(Serverhascontainer.last)
  end

  test "should show serverhascontainer" do
    get serverhascontainer_url(@serverhascontainer)
    assert_response :success
  end

  test "should get edit" do
    get edit_serverhascontainer_url(@serverhascontainer)
    assert_response :success
  end

  test "should update serverhascontainer" do
    patch serverhascontainer_url(@serverhascontainer), params: { serverhascontainer: { container_id: @serverhascontainer.container_id, server_id: @serverhascontainer.server_id } }
    assert_redirected_to serverhascontainer_url(@serverhascontainer)
  end

  test "should destroy serverhascontainer" do
    assert_difference('Serverhascontainer.count', -1) do
      delete serverhascontainer_url(@serverhascontainer)
    end

    assert_redirected_to serverhascontainers_url
  end
end
