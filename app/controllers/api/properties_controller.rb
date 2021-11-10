module Api
  class PropertiesController < ApiController
    def index
      render json: Property.all
    end
  end
end
