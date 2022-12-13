class BirdsController < ApplicationController
  before_action :set_bird, only: %i[ show update destroy ]

  # GET /birds
  def index
    birds = Bird.all

    render json: birds
  end

  # GET /birds/1
  def show
    render json: bird
  end

  # POST /birds
  def create 
    bird = Bird.new(bird_params)
    if bird.save 
        render json: bird
    else 
        render json: {errors: bird.errors.messages}, status: 422
    end
end

  # PATCH/PUT /birds/1
  def update 
    bird = bird.find_by(id: params[:id])
    if bird.update(adventure_params)
        render json: bird
    else 
        render json: {errors: bird.errors.messages}, status: 422
    end
end

  # DELETE /birds/1
  def destroy
    bird.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bird_params
      params.require(:bird).permit(:name, :image, :description, :adventure_id)
    end
end
