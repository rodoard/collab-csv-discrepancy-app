# frozen_string_literal: true

require "test_helper"
require "helpers/file_data"

class DataControllerTest < ActionDispatch::IntegrationTest
  include FileData::CSV
  test "returns error when number of upload files is less than two" do
    post "/data/csv", params:{
      csv: {
        files: [csv_data1]
      }
    }
    puts @response.body.inspect
    assert_response :bad_request
  end

  test "returns all discrepancies" do
    post "/data/csv", params:{
      csv: {
        files: [csv_data1, csv_data2]
      }
    }
    expected = all_discrepancies
    expected.each do |email|
      message = "Expected response to contain: #{email}"
      assert @response.body.include?(email), message
    end
  end
  test "returns subscriber count discrepancies " do
    post "/data/csv", params:{
      csv: {
        files: [csv_data1, csv_data2],
        concern: :subscriber_count
      }
    }
    expected = subscriber_count_discrepancies
    expected.each do |email|
      message = "Expected response to contain: #{email}"
      assert @response.body.include?(email), message
    end
  end

  test "returns channel owner discrepancies " do
    post "/data/csv", params:{
      csv: {
        files: [csv_data1, csv_data2],
        concern: :channel_owner
      }
    }
    expected = channel_ownership_discrepancies
    expected.each do |email|
      message = "Expected response to contain: #{email}"
      assert @response.body.include?(email), message
    end
  end
end
