require 'test_helper'

class CablesControllerTest < ActionController::TestCase
  setup do
    @cable = cables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cable" do
    assert_difference('Cable.count') do
      post :create, cable: { color: @cable.color, from_nic: @cable.from_nic, server_id: @cable.server_id, to_end: @cable.to_end, to_nic: @cable.to_nic }
    end

    assert_redirected_to cable_path(assigns(:cable))
  end

  test "should show cable" do
    get :show, id: @cable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cable
    assert_response :success
  end

  test "should update cable" do
    put :update, id: @cable, cable: { color: @cable.color, from_nic: @cable.from_nic, server_id: @cable.server_id, to_end: @cable.to_end, to_nic: @cable.to_nic }
    assert_redirected_to cable_path(assigns(:cable))
  end

  test "should destroy cable" do
    assert_difference('Cable.count', -1) do
      delete :destroy, id: @cable
    end

    assert_redirected_to cables_path
  end
end
