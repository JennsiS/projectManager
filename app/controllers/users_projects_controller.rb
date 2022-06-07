class UsersProjectsController < ApplicationController
  before_action :set_users_project, only: %i[ show edit update destroy ]

  # GET /users_projects or /users_projects.json
  def index
    @users_projects = UsersProject.all
  end

  # GET /users_projects/1 or /users_projects/1.json
  def show
  end

  # GET /users_projects/new
  def new
    @users_project = UsersProject.new
  end

  # GET /users_projects/1/edit
  def edit
  end

  # POST /users_projects or /users_projects.json
  def create
    @users_project = UsersProject.new(users_project_params)

    respond_to do |format|
      if @users_project.save
        format.html { redirect_to users_project_url(@users_project), notice: "Users project was successfully created." }
        format.json { render :show, status: :created, location: @users_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_projects/1 or /users_projects/1.json
  def update
    respond_to do |format|
      if @users_project.update(users_project_params)
        format.html { redirect_to users_project_url(@users_project), notice: "Users project was successfully updated." }
        format.json { render :show, status: :ok, location: @users_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_projects/1 or /users_projects/1.json
  def destroy
    @users_project.destroy

    respond_to do |format|
      format.html { redirect_to users_projects_url, notice: "Users project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_project
      @users_project = UsersProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_project_params
      params.require(:users_project).permit(:user_id, :project_id, :rol_project_user)
    end
end