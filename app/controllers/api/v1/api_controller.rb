class Api::V1::ApiController < ApplicationController
  include ApplicationHelper
  respond_to :json
  skip_before_action :verify_authenticity_token
end