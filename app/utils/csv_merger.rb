# frozen_string_literal: true

class CsvMerger
  def self.merge(*csv_strings, headers:nil)
    csvs = csv_strings.map {|csv_string| CSV.new(csv_string).read}
    csv1_headers = csvs[0][0]
    unless headers
      headers = csv1_headers
    end
    existing = csvs
    csv_string = CSV.generate do |csv|
      csv << headers
      existing.each do |file|
        file.shift                  # remove the headers of each file
        file.each do |row|
          csv << row
        end
      end
    end
  end
end
