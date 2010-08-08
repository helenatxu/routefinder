require 'test_helper'

class RoutepointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routepoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routepoint" do
    assert_difference('Routepoint.count') do
      post :create, :routepoint => { }
    end

    assert_redirected_to routepoint_path(assigns(:routepoint))
  end

  test "should show routepoint" do
    get :show, :id => routepoints(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => routepoints(:one).to_param
    assert_response :success
  end

  test "should update routepoint" do
    put :update, :id => routepoints(:one).to_param, :routepoint => { }
    assert_redirected_to routepoint_path(assigns(:routepoint))
  end

  test "should destroy routepoint" do
    assert_difference('Routepoint.count', -1) do
      delete :destroy, :id => routepoints(:one).to_param
    end

    assert_redirected_to routepoints_path
  end
end
