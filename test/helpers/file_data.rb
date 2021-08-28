module FileData
  module CSV
    extend ActiveSupport::Concern
    def csv_data
      unless @csv_data
        @csv_data = file_fixture("discrepancy_data.csv").read
      end
      @csv_data
    end
    def csv_data1
      unless @csv_data
        @csv_data1 = file_fixture("discrepancy_data_1.csv").read
      end
      @csv_data1
    end
    def csv_data2
      unless @csv_data
        @csv_data2 = file_fixture("discrepancy_data_2.csv").read
      end
      @csv_data2
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
