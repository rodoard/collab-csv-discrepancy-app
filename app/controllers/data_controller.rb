class DataController < ApplicationController
  layout false
  before_action :check_minimum_files_required, only: :csv
  def csv
    files = Uploads.get_uploaded(params[:csv][:files])
    concern = params[:csv][:concern]
    csv_merged = CsvMerger.merge(files[0], files[1])
    models = DiscrepancyCsvParser.parse(csv_merged)
    @discrepancies = DiscrepancyDetector.new(models).detect(concern: concern).discrepancies
  end
  private
  def check_minimum_files_required
    unless csv_params.permitted?
      raise ActionController::ParameterMissing
    end
    unless params[:csv][:files].length > 1
      raise NotEnoutFilesSubmitted
    end
  end
  def csv_params
    params.require(:csv).permit(:concern, :files => [])
  end
end
