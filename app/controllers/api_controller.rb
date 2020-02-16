class ApiController < ApplicationController
  before_action :authenticate!

  def index
    render json: { message: 'OK' }
  end

  def not_found_url
    ENV['not_found_url']
  end

  protected

  def authenticate!
    if request.headers['authorization'] != ENV['api_key']
      render json: { message: 'Not authorized' }, status: :unauthorized

      return false
    end
  end
end
