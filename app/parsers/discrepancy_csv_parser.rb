# frozen_string_literal: true

class DiscrepancyCsvParser
  ACCOUNT_EMAIL_KEY= "Account Email"
  CHANNEL_KEY="YouTube Channel"
  SUBSCRIBER_COUNT_KEY = "Subscriber Count"
  
  def self.parse csv_string
    models = []
    trim_converter = lambda { |header| header.strip }
    CSV.parse(csv_string, headers:true, header_converters: trim_converter) do |row|
      models << DiscrepancyData.new(**discrepancy_data_attributes(row))
    end
    models  
  end   

  private 
  def self.discrepancy_data_attributes row 
    {
      account_email: row[ACCOUNT_EMAIL_KEY],
      youtube_channel: row[CHANNEL_KEY],
      subscriber_count: row[SUBSCRIBER_COUNT_KEY].to_i
    }
  end   
end 
