class ApplicationController < ActionController::Base
  class NotEnoutFilesSubmitted < StandardError
  end

  rescue_from NotEnoutFilesSubmitted , :with => :not_enough_files_submitted
  rescue_from ActionController::ParameterMissing , :with => :parameter_missing

  private
  def parameter_missing
    render json:{error: 'required fields are missing'} , status: :bad_request

  end
  def not_enough_files_submitted
    render json:{error: 'not enough files submitted'} , status: :bad_request
  end
end
