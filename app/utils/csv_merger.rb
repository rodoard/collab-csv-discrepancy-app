# frozen_string_literal: true

class CsvMerger
  def self.merge(csvone_string, csvtwo_string, headers:nil)
    csvone = CSV.new(csvone_string).read
    csvtwo = CSV.new(csvtwo_string).read
    csv1_headers = csvone[0]
    unless headers
      headers = csv1_headers
    end
    existing = [csvone, csvtwo]
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
