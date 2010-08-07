require 'test_helper'

class PlacecommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placecomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placecomment" do
    assert_difference('Placecomment.count') do
      post :create, :placecomment => { }
    end

    assert_redirected_to placecomment_path(assigns(:placecomment))
  end

  test "should show placecomment" do
    get :show, :id => placecomments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => placecomments(:one).to_param
    assert_response :success
  end

  test "should update placecomment" do
    put :update, :id => placecomments(:one).to_param, :placecomment => { }
    assert_redirected_to placecomment_path(assigns(:placecomment))
  end

  test "should destroy placecomment" do
    assert_difference('Placecomment.count', -1) do
      delete :destroy, :id => placecomments(:one).to_param
    end

    assert_redirected_to placecomments_path
  end
end
