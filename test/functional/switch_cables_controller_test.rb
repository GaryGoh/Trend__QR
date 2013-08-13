require 'test_helper'

class SwitchCablesControllerTest < ActionController::TestCase
  setup do
    @switch_cable = switch_cables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switch_cables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch_cable" do
    assert_difference('SwitchCable.count') do
      post :create, switch_cable: { color: @switch_cable.color, from_device: @switch_cable.from_device, from_port: @switch_cable.from_port, mode: @switch_cable.mode, protocal: @switch_cable.protocal, to_device: @switch_cable.to_device, to_port: @switch_cable.to_port, type: @switch_cable.type, vlan: @switch_cable.vlan }
    end

    assert_redirected_to switch_cable_path(assigns(:switch_cable))
  end

  test "should show switch_cable" do
    get :show, id: @switch_cable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switch_cable
    assert_response :success
  end

  test "should update switch_cable" do
    put :update, id: @switch_cable, switch_cable: { color: @switch_cable.color, from_device: @switch_cable.from_device, from_port: @switch_cable.from_port, mode: @switch_cable.mode, protocal: @switch_cable.protocal, to_device: @switch_cable.to_device, to_port: @switch_cable.to_port, type: @switch_cable.type, vlan: @switch_cable.vlan }
    assert_redirected_to switch_cable_path(assigns(:switch_cable))
  end

  test "should destroy switch_cable" do
    assert_difference('SwitchCable.count', -1) do
      delete :destroy, id: @switch_cable
    end

    assert_redirected_to switch_cables_path
  end
end
