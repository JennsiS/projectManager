class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!

  # GET /projects or /projects.json
  def index
    respond_to do |format|
      format.html do 
        @projects = Project.all
      end
      format.json do
        render json: Project.all
      end
    end
    
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_phases
    return if params[:project_id].blank?

    p = Project.find(params[:project_id])
    @phases = p.phases.distinct(:phase_id)
    
    respond_to do |format|
      format.json { render json: @phases, stauts: :ok}
    end
  end

  def get_team
    return if params[:project_id].blank?

    p = Project.find(params[:project_id])
    users_projects = p.users_projects.where(rol_project_user: "Member").select("user_id")
    
    respond_to do |format|
      format.json { render json: users_projects, stauts: :ok}
    end
  end


  def get_team_members
    return if params[:project_id].blank?

    p = Project.find(params[:project_id])
    
    respond_to do |format|
      format.json { render json: p.users, stauts: :ok}
    end
  end

  def get_last_id 
    p = Project.select("id").last
    respond_to do |format|
      format.json { render json: p, stauts: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :start_date, :finish_date, :state, :progress)
    end
end
