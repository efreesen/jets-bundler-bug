class ShortenController < ApiController
  def create
    if resource.save
      render json: { url: "#{request.url.gsub('shorten', resource.uuid)}"}, status: :created
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  private
    def resource
      @resource ||= Url.where(original: original_url, uuid: uuid).first_or_initialize
    end

    def original_url
      params[:url]
    end

    def uuid
      params[:uuid]
    end
end
