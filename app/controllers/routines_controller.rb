class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  # GET /routines
  def index
    @pagy, @routines = pagy(Routine.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @routines.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @routines.load
  end

  # GET /routines/1
  def show
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines
  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      redirect_to @routine, notice: "Routine was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /routines/1
  def update
    if @routine.update(routine_params)
      redirect_to @routine, notice: "Routine was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /routines/1
  def destroy
    @routine.destroy
    redirect_to routines_url, notice: "Routine was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_routine
    @routine = Routine.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def routine_params
    params.require(:routine).permit(:user_id, :account_id, :brand_id, :name, :description, :action_days, :est_time, :total_steps)
  end
end
