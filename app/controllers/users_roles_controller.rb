class UsersRolesController < ApplicationController
  before_action :set_users_role, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  # GET /users_roles or /users_roles.json
  def index
    @users_roles = UsersRole.all
  end

  # GET /users_roles/1 or /users_roles/1.json
  def show
  end

  # GET /users_roles/new
  def new
    @users_role = UsersRole.new
  end

  # GET /users_roles/1/edit
  def edit
  end

  # POST /users_roles or /users_roles.json
  def create
    @users_role = UsersRole.new(users_role_params)

    respond_to do |format|
      if @users_role.save
        format.html { redirect_to users_role_url(@users_role), notice: "Users role was successfully created." }
        format.json { render :show, status: :created, location: @users_role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_roles/1 or /users_roles/1.json
  def update
    respond_to do |format|
      if @users_role.update(users_role_params)
        format.html { redirect_to users_role_url(@users_role), notice: "Users role was successfully updated." }
        format.json { render :show, status: :ok, location: @users_role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_roles/1 or /users_roles/1.json
  def destroy
    @users_role.destroy

    respond_to do |format|
      format.html { redirect_to users_roles_url, notice: "Users role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_role
      @users_role = UsersRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_role_params
      params.require(:users_role).permit(:user_id, :role_id)
    end
end
