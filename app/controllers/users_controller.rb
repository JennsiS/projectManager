class UsersController < ApplicationController
#class UsersController < Devise::UsersController
before_action :set_user, only: %i[ show edit update destroy ]
    # GET /users or /users.json
    def show; end
  def index
    respond_to do |format|
      format.html do 
        @users = User.all
      end
      format.json do
        render json: User.all
      end
    end 
  end


  
    def get_users
        return if params[:project_id].blank?
    
        p = Project.find(params[:project_id])
        
        respond_to do |format|
          format.json { render json: p.phases, stauts: :ok}
        end
    end

    def get_user_id
        return if params[:email].blank?
        format.json do
            render json: User.select("id").where(email:params[:email])
        end
    end


    def create
        @user = User.new(user_params)
        #@user.password = params[:password]

        respond_to do |format|
            if @user.save
              format.html { redirect_to project_url(@user), notice: "User was successfully created." }
              format.json { render :show, status: :created, location:@user }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end

    end
    
    def destroy
        @user.destroy
    end
    
    private
        def set_user
          @user = User.find(params[:id])
        end
    
        def user_params
          params.require(:user).permit(:email, :password)
        end


end