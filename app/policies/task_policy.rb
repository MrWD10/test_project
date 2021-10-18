class TaskPolicy < ApplicationPolicy
  def initialize(user, business,task)
    @user = user
    @business = business
    @task =task
  end

  def index?
    #@user.support? ? 
    @user.admin? || @user.writingbroker? || @user.support?
  end

  def new?
    @user.admin? || @user.writingbroker?
  end

  def create?
    @user.admin? || @user.writingbroker?
  end

  def edit?
    update?
  end

  def update?
    @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end
  
  def show?
   # @user.writingbroker? ? @task.business_id.business_users.where()
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
     @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?
     @user.writingbroker? || @user.support? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end

  def destroy?
    @user.writingbroker? ?  @business.business_users.where(user_id:  @user.id).present? : @user.admin?

  end
end
