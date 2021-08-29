# frozen_string_literal: true

require "test_helper"
require "helpers/file_data"

class DataControllerTest < ActionDispatch::IntegrationTest
  include FileData::CSV
  test "returns error when number of upload files is less than two" do
    post "/data/csv", params:{
      csv: {
        files: get_uploaded_csv_file(["discrepancy_data_1.csv"])
      }
    }
    assert_response :bad_request
  end

  test "handles invalid params " do
    post "/data/csv", params:{
      files: ["discrepancy_data_1.csv"]
    }
    assert_response :bad_request
  end

  test "returns all discrepancies" do
    post "/data/csv", params:{
      csv: {
        files: get_uploaded_csv_file(["discrepancy_data_1.csv", "discrepancy_data_2.csv", "discrepancy_data_3.csv", "discrepancy_data_4.csv"])
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
        files: get_uploaded_csv_file(["discrepancy_data_1.csv", "discrepancy_data_2.csv", "discrepancy_data_3.csv", "discrepancy_data_4.csv"]),
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
        files: get_uploaded_csv_file(["discrepancy_data_1.csv", "discrepancy_data_2.csv", "discrepancy_data_3.csv", "discrepancy_data_4.csv"]),
        concern: :channel_ownership
      }
    }
    expected = channel_ownership_discrepancies
    expected.each do |email|
      message = "Expected response to contain: #{email}"
      assert @response.body.include?(email), message
    end
  end
end
