class BatchController < ApiController
  def create
    urls = original_urls.map do |original_url|
      resource = Url.where(original: original_url).first_or_create

      [original_url, "#{request.url.gsub('batch', resource.uuid)}"]
    end.to_h

    render json: { urls: urls }, status: :created
  end

  private
    def original_urls
      params[:urls]
    end
end
