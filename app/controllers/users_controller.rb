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
end