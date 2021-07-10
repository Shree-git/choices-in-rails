class ImpulsesController < ApplicationController
  before_action :set_impulse, only: %i[ show edit update destroy ]

  # GET /impulses or /impulses.json
  def index
    @impulses = Impulse.all
  end

  # GET /impulses/1 or /impulses/1.json
  def show
  end

  # GET /impulses/new
  def new
    @impulse = Impulse.new
  end

  # GET /impulses/1/edit
  def edit
  end

  # POST /impulses or /impulses.json
  def create
    @impulse = Impulse.new(impulse_params)

    respond_to do |format|
      if @impulse.save
        format.html { redirect_to @impulse, notice: "Impulse was successfully created." }
        format.json { render :show, status: :created, location: @impulse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @impulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impulses/1 or /impulses/1.json
  def update
    respond_to do |format|
      if @impulse.update(impulse_params)
        format.html { redirect_to @impulse, notice: "Impulse was successfully updated." }
        format.json { render :show, status: :ok, location: @impulse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @impulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impulses/1 or /impulses/1.json
  def destroy
    @impulse.destroy
    respond_to do |format|
      format.html { redirect_to impulses_url, notice: "Impulse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impulse
      @impulse = Impulse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def impulse_params
      params.require(:impulse).permit(:title, :level, :desc)
    end
end
