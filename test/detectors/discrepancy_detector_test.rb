require 'test_helper'
require "helpers/file_data"

class  DiscrepancyDetectorTest < ActiveSupport::TestCase
  include FileData::CSV
  test "finds all discrepancies" do
    models = DiscrepancyCsvParser.parse(csv_data)
    discrepancies = DiscrepancyDetector.new(models).detect.discrepancies
    expected = all_discrepancies
    assert arrays_same?(expected, discrepancies)
  end

  test "finds channel ownership discrepancies" do
    models = DiscrepancyCsvParser.parse(csv_data)
    discrepancies = DiscrepancyDetector.new(models).detect(concern: :channel_ownership).discrepancies
    expected = channel_ownership_discrepancies
    assert arrays_same?(expected, discrepancies)
  end

  test "finds suscriber count discrepancies" do
    models = DiscrepancyCsvParser.parse(csv_data)
    discrepancies = DiscrepancyDetector.new(models).detect(concern: :subscriber_count).discrepancies
    expected = subscriber_count_discrepancies
    assert arrays_same?(expected, discrepancies)
  end
end
