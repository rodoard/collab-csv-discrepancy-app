module FileData
  module CSV
    extend ActiveSupport::Concern
    def csv_data
      unless @csv_data
        @csv_data = file_fixture("discrepancy_data.csv").read
      end
      @csv_data
    end
    def all_discrepancies
      [
        "test_1@gmail.com",
        "test_2@gmail.com",
        "test_3@gmail.com"
      ]
    end
    def subscriber_count_discrepancies
      [
        "test_1@gmail.com",
        "test_3@gmail.com"
      ]
    end
    def channel_ownership_discrepancies
      [
        "test_1@gmail.com",
        "test_2@gmail.com"
      ]
    end
  end
end
