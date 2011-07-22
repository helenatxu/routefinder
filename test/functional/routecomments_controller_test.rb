require 'test_helper'

class RoutecommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routecomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routecomment" do
    assert_difference('Routecomment.count') do
      post :create, :routecomment => { }
    end

    assert_redirected_to routecomment_path(assigns(:routecomment))
  end

  test "should show routecomment" do
    get :show, :id => routecomments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => routecomments(:one).to_param
    assert_response :success
  end

  test "should update routecomment" do
    put :update, :id => routecomments(:one).to_param, :routecomment => { }
    assert_redirected_to routecomment_path(assigns(:routecomment))
  end

  test "should destroy routecomment" do
    assert_difference('Routecomment.count', -1) do
      delete :destroy, :id => routecomments(:one).to_param
    end

    assert_redirected_to routecomments_path
  end
end
