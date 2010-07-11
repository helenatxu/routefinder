require 'test_helper'

class SearchRoutesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SearchRoute.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SearchRoute.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to search_route_url(assigns(:search_route))
  end
  
  def test_show
    get :show, :id => SearchRoute.first
    assert_template 'show'
  end
end
