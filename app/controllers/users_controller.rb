class UsersController < ApplicationController
    before_action :set_user, only: [ :show, :edit, :update, :destroy ]

    def index

      @users = User.order(created_at: :desc)

      authorize @users 
    


end
    def new
        @user = User.new

        authorize @user

      # byebug
    end

    def show_business
    
    end

    def show
      authorize @user
    end

    def create

        @user = User.new(user_params)
        authorize @user

        respond_to do |format|
          if @user.save
         #   format.js
            format.html { redirect_to users_path, notice: "user was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        
    end
  end

  def edit
    authorize @user

  
    # @portfolio_item = Portfolio.find(params[:id]) 
 end

 def update
  authorize @user

    # @portfolio_item = Portfolio.find(params[:id]) 
     respond_to do |format|
       if @user.update(user_params)
         #current_user.add_role :editor, @portfolio_item

         format.html { redirect_to users_path, notice: "user item was successfully updated." }
       else
         format.html { render :edit, status: :unprocessable_entity }
       end
     end
 end



 def destroy
        # @portfolio_item = Portfolio.find(params[:id]) 
        authorize @user

         @user.destroy
        # current_user.add_role :destroyer, @portfolio_item
    
         respond_to do |format|
           format.html { redirect_to users_url, notice: "user item was successfully deleted." }
         end
       end
    
       private
     def set_user
       @user = User.find(params[:id])
     end
    
    def user_params
    params.require(:user).permit(:username, :email,:password,:password_confirmation, :userrole)
    
    end


end