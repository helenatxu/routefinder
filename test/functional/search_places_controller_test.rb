require 'test_helper'

class SearchPlacesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SearchPlace.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SearchPlace.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to search_place_url(assigns(:search_place))
  end
  
  def test_show
    get :show, :id => SearchPlace.first
    assert_template 'show'
  end
end
