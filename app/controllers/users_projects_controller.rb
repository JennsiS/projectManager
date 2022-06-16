class UsersProjectsController < ApplicationController
  before_action :set_users_project, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  # GET /users_projects or /users_projects.json
  def index
    @users_projects = UsersProject.all
    # respond_to do |format|
    #   format.html do 
    #     @users_projects = UsersProject.all
    #   end
    #   format.json do
    #     users_projects_list = UsersProject.all.map do |userProject| 
    #       {users_projects: userProject}
    #     end

    #     render json: {list: users_projects_list}
    #   end
    # end


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

  def get_members 
    return if params[:project_id].blank?

    @users_project = UsersProject.where(rol_project_user: "Member", project_id: params[:project_id] ).select("user_id")

    respond_to do |format|
      format.json { render json: @users_project, stauts: :ok}
    end
  
  end

  def createRelation
    #return if params[:project_id].blank?
    users = [:user_id]
    project = [:project_id]
    rol = [:rol_project_user]

    users.each do |actual_user|
      @users_project = UsersProject.new(actual_user,project,rol)
      #text = "Current number is: #{n}"
      #puts text
    end

    @users_project = UsersProject.new(user,project,rol)

    #@users_project = UsersProject.new(users_project_params)

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
