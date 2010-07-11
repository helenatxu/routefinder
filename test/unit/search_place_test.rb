require 'test_helper'

class SearchPlaceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SearchPlace.new.valid?
  end
end
