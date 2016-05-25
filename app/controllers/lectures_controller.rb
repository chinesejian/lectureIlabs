class LecturesController < ApplicationController
  
    before_filter :authenticate_user!
    before_filter :check_admin_status

  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  def index
    @lectures = Lecture.all
  end

  def show
  end

  def new
    @lecture = Lecture.new
    @host_user_id = current_user.id
  end

  def edit
  end

  def create
    @lecture = Lecture.create(lecture_params)

    redirect_to lectures_url
  end

  def update
    @lecture.update(lecture_params) 
    redirect_to lectures_url
  end

  def destroy
    @lecture.destroy
    redirect_to lectures_url
  end

  private
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    def lecture_params
      params.require(:lecture).permit(:id, :name, :description, :url, :host_user_id, :lecture_date, :lecture_time)
    end
end
