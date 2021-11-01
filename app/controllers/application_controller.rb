class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :missing_params
end
