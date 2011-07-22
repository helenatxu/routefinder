require 'test_helper'

class SearchRouteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SearchRoute.new.valid?
  end
end
