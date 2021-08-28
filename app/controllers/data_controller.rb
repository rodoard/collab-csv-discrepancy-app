class DataController < ApplicationController
  layout false
  before_action :check_minimum_files_required, only: :csv
  def csv
    files = params[:csv][:files]
    concern = params[:csv][:concern]
    csv_merged = CsvMerger.merge(files[0], files[1])
    models = DiscrepancyCsvParser.parse(csv_merged)
    @discrepancies = DiscrepancyDetector.new(models).detect(concern: concern).discrepancies
  end
  private
  def check_minimum_files_required
    unless params[:csv][:files].length > 1
      raise NotEnoutFilesSubmitted
    end
  end
end
