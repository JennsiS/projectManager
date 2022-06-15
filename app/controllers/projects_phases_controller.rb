class ProjectsPhasesController < ApplicationController
  before_action :set_projects_phase, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  # GET /projects_phases or /projects_phases.json
  def index
    project_id = params[:project_id]
    
    if project_id
      @projects_phases = ProjectsPhase.where(project_id: project_id)
      return
    end
    @projects_phases = ProjectsPhase.all
    
  end

  # GET /projects_phases/1 or /projects_phases/1.json
  def show
  end

  # GET /projects_phases/new
  def new
    @projects_phase = ProjectsPhase.new
  end

  # GET /projects_phases/1/edit
  def edit
  end

  # POST /projects_phases or /projects_phases.json
  def create
    @projects_phase = ProjectsPhase.new(projects_phase_params)

    respond_to do |format|
      if @projects_phase.save
        format.html { redirect_to projects_phase_url(@projects_phase), notice: "Projects phase was successfully created." }
        format.json { render :show, status: :created, location: @projects_phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @projects_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects_phases/1 or /projects_phases/1.json
  def update
    respond_to do |format|
      if @projects_phase.update(projects_phase_params)
        format.html { redirect_to projects_phase_url(@projects_phase), notice: "Projects phase was successfully updated." }
        format.json { render :show, status: :ok, location: @projects_phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @projects_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects_phases/1 or /projects_phases/1.json
  def destroy
    @projects_phase.destroy

    respond_to do |format|
      format.html { redirect_to projects_phases_url, notice: "Projects phase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projects_phase
      @projects_phase = ProjectsPhase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projects_phase_params
      params.require(:projects_phase).permit(:user_id, :phase_id, :project_id, :role_user)
    end
end
