require 'test_helper'

class FavoriteplacesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favoriteplaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favoriteplace" do
    assert_difference('Favoriteplace.count') do
      post :create, :favoriteplace => { }
    end

    assert_redirected_to favoriteplace_path(assigns(:favoriteplace))
  end

  test "should show favoriteplace" do
    get :show, :id => favoriteplaces(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => favoriteplaces(:one).to_param
    assert_response :success
  end

  test "should update favoriteplace" do
    put :update, :id => favoriteplaces(:one).to_param, :favoriteplace => { }
    assert_redirected_to favoriteplace_path(assigns(:favoriteplace))
  end

  test "should destroy favoriteplace" do
    assert_difference('Favoriteplace.count', -1) do
      delete :destroy, :id => favoriteplaces(:one).to_param
    end

    assert_redirected_to favoriteplaces_path
  end
end
