class Api::PropertiesController < ApiController

  def index
    render json: Property.all
  end

end