class RedirectsController < ApiController
  skip_before_action :authenticate!, only: :index
  before_action :set_url

  def index
    redirect_to @url&.original || not_found_url
  end

  private

  def set_url
    @url = Url.find_by(uuid: params[:url_id])
  end
end
