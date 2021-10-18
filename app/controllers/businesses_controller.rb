class BusinessesController < ApplicationController
    before_action :set_post, only: %i[  show edit update destroy ]
    def index
         @businesses=Business.all
         @all_users=User.all
         authorize @businesses

    end

       def new
        @business = Business.new
        @all_users=User.all

        @business_user=@business.business_users.build
        authorize @business

       
    end

    def show
      #  byebug
      authorize @business

    end

    def create

        @business = Business.new(business_params)
        authorize @business

        @business.owner=current_user

        @business.business_users.build(user_id: current_user.id)

        params[:users][:id].each do |u|
        if !u.empty?
          @business.business_users.build(:user_id=>u)
       
        end
      end
        respond_to do |format|
          if @business.save
            format.html { redirect_to businesses_path, notice: "Business was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        
    end
  end

  def edit
    authorize @business

    # @portfolio_item = Portfolio.find(params[:id]) 
 end

 def update
  authorize @business

  @business.business_users.where("business_users.business_id= :address", :address=>@business).delete_all

  @business.business_users.build(user_id: current_user.id)

  params[:users][:id].each do |u|
  if !u.empty?
    @business.business_users.build(:user_id=>u)
 
  end
end
    # @portfolio_item = Portfolio.find(params[:id]) 
     respond_to do |format|
       if @business.update(business_params)
         #current_user.add_role :editor, @portfolio_item

         format.html { redirect_to businesses_path, notice: "Business item was successfully updated." }
       else
         format.html { render :edit, status: :unprocessable_entity }
       end
     end
 end

 def destroy
    # @portfolio_item = Portfolio.find(params[:id]) 
    authorize @business

     @business.destroy
    # current_user.add_role :destroyer, @portfolio_item

     respond_to do |format|
       format.html { redirect_to businesses_url, notice: "Business item was successfully deleted." }
     end
   end

   private
 def set_post
   @business = Business.find(params[:id])
 end

def business_params
params.require(:business).permit( :name, :decription)

end



end