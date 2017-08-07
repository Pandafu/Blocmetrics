class RegisteredApplicationsController < ApplicationController
  before_action :find_app, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @apps = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @app = RegisteredApplication.new
  end

  def update

    if @app.update(app_param)
      flash[:notice] = "Saved!"
      render 'show'
    else
      flash[:alert] = "error!"
      render 'edit'
    end
  end

  def create
    @app = current_user.registered_applications.new(app_param)

    if @app.save
      flash[:notice] = "Created!"
      redirect_to registered_applications_path
    else
      flash[:alert] = "error!"
      #so I don't lose data inside the form
      render @app
    end
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])

    if @app.destroy
    flash[:alert] = "destroyed!"
    redirect_to registered_applications_path
  else
    flash.now[:alert] = "Error!"
    render registered_applications_path
  end
  end

  private

  def app_param
    params.require(:registered_application).permit(:name, :url, :user_id)
  end

  def find_app
    @app = RegisteredApplication.find(params[:id])
  end
end
