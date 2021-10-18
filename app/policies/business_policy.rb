class BusinessPolicy < ApplicationPolicy

  

  def initialize(user, business)
    @user = user
    @business = business
  end

  def index?
    @user.admin? || @user.writingbroker? ||@user.support?
  end

  def new?
    @user.admin? || @user.writingbroker?
  end

  def edit?
    update?
  end

  def create?
    @user.admin? || @user.writingbroker?
  end

  def update?
    @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end
  
  def show?
    @user.support? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
     @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

    end


  def destroy?
    @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end


 
  
end