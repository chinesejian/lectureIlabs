class LecturesController < ApplicationController
  
    before_filter :authenticate_user!
    before_filter :check_admin_status

  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
    @host_user_id = current_user.id
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.create(lecture_params)

    redirect_to lectures_url
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    @lecture.update(lecture_params) 
    redirect_to lectures_url
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    redirect_to lectures_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:id, :name, :description, :url, :host_user_id, :lecture_date, :lecture_time)
    end
end
