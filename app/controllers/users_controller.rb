class UsersController < ApplicationController
    # GET /users or /users.json
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

end