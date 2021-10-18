class EndUsersController < ApplicationController
        before_action :set_post, only: %i[  show edit update destroy ]
        def index
             @end_users=EndUser.all
        end
    
           def new
            @end_user = EndUser.new
            User.create!(name: params[:name], email: params[:email])
           
        end
    
        def show
        
        end
    
        def create
            @end_user = EndUser.new(end_user_params)
            
            respond_to do |format|
              if @end_user.save
                format.html { redirect_to end_users_path, notice: "End user was successfully created." }
              else
                format.html { render :new, status: :unprocessable_entity }
              end
            
        end
      end
    
      def edit
        # @portfolio_item = Portfolio.find(params[:id]) 
     end
    
     def update
        # @portfolio_item = Portfolio.find(params[:id]) 
         respond_to do |format|
           if @end_user.update(end_user_params)
             #current_user.add_role :editor, @portfolio_item
    
             format.html { redirect_to end_users_path, notice: "End user item was successfully updated." }
           else
             format.html { render :edit, status: :unprocessable_entity }
           end
         end
     end
    
     def destroy
        # @portfolio_item = Portfolio.find(params[:id]) 
    
         @end_user.destroy
        # current_user.add_role :destroyer, @portfolio_item
    
         respond_to do |format|
           format.html { redirect_to end_users_url, notice: "End user item was successfully deleted." }
         end
       end
    
       private
     def set_post
       @end_user = EndUser.find(params[:id])
     end
    
    def end_user_params
    params.require(:end_user).permit(:name, :e_mail,:pass)
    
    end

end
