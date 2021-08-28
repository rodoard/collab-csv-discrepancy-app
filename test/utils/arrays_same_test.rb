# frozen_string_literal: true

require 'test_helper'

class ArraysSameTest < ActiveSupport::TestCase
  test "checks if two arrays are same" do
    arr1 = ["test_1@gmail.com",  "test_2@gmail.com"]
    arr2 = ["test_1@gmail.com",  "test_2@gmail.com"].reverse
    arr3 = ["test_1@gmail.com"]
    arr4 = []
    assert arrays_same?(arr1, arr2)
    assert_not arrays_same?(arr1, arr3)
    assert_not arrays_same?(arr1, arr4)
  end
end
