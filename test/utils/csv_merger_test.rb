# frozen_string_literal: true

require "test_helper"
require "helpers/file_data"

class CsvMergerTest < ActiveSupport::TestCase
  include FileData::CSV
  test "combines multiple csvs into one" do
    csv = CsvMerger.merge(csv_data1, csv_data2, csv_data3, csv_data4)
    expected = csv_data
    assert_equal(expected,  csv, "Expected combined split csvs to euqal original unsplit csv.")
  end
end
