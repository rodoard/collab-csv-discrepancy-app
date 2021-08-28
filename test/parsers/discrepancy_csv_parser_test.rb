require 'test_helper'
require "helpers/file_data"

class  DiscrepancyCsvParserTest < ActiveSupport::TestCase
  include FileData::CSV
  test "converts csv into discrepancy data models" do
    model = DiscrepancyCsvParser.parse(csv_data).first
    assert model.is_a?(DiscrepancyData)
    assert model.valid?
  end
end
