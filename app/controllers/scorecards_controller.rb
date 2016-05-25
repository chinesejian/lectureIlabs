class ScorecardsController < ApplicationController
  before_action :set_scorecard, only: [:show, :edit, :update, :destroy]

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @scorecard = Scorecard.where(user_id: current_user.id, lecture_id: params[:lecture_id]).first || Scorecard.new
  end

  def show
  end

  def new
    @scorecard = Scorecard.new
  end

  def edit
  end

  def create
    @scorecard = Scorecard.new(scorecard_params)

    respond_to do |format|
      if @scorecard.save
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully created.' }
        format.json { render :show, status: :created, location: @scorecard }
      else
        format.html { render :new }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scorecard.update(scorecard_params)
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully updated.' }
        format.json { render :show, status: :ok, location: @scorecard }
      else
        format.html { render :edit }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @scorecard.destroy
    respond_to do |format|
      format.html { redirect_to scorecards_url, notice: 'Scorecard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scorecard
      @scorecard = Scorecard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scorecard_params
      params.require(:scorecard).permit(:overall, :content, :performance, :comment, :lecture_id)
    end
end
