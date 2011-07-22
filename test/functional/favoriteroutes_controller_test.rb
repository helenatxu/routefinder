require 'test_helper'

class FavoriteroutesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favoriteroutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favoriteroute" do
    assert_difference('Favoriteroute.count') do
      post :create, :favoriteroute => { }
    end

    assert_redirected_to favoriteroute_path(assigns(:favoriteroute))
  end

  test "should show favoriteroute" do
    get :show, :id => favoriteroutes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => favoriteroutes(:one).to_param
    assert_response :success
  end

  test "should update favoriteroute" do
    put :update, :id => favoriteroutes(:one).to_param, :favoriteroute => { }
    assert_redirected_to favoriteroute_path(assigns(:favoriteroute))
  end

  test "should destroy favoriteroute" do
    assert_difference('Favoriteroute.count', -1) do
      delete :destroy, :id => favoriteroutes(:one).to_param
    end

    assert_redirected_to favoriteroutes_path
  end
end
