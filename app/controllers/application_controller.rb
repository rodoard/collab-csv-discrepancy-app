class ApplicationController < ActionController::Base
  class NotEnoutFilesSubmitted < StandardError
  end

  rescue_from NotEnoutFilesSubmitted , :with => :not_enough_files_submitted

  private
  def not_enough_files_submitted
    render json:{error: 'not enough files submitted'} , status: :bad_request
  end
end
