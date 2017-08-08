class API::EventsController < ApplicationController

  before_filter :set_access_control_headers

  def set_access_control_headers
    # allow requests from any origin
    headers['Access-Control-Origin'] = '*'
    # permit the POST, GET, OPTIONS request methods
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    # allow the header Content-Type, which is used in HTTP requests to declare the type of the data being sent
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
      return
    end

  @event = registered_application.events.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end



  end

  def preflight
    #doesn't need to render anything apart from a 200 status code
    head 200
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

end
