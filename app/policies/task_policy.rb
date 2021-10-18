class TaskPolicy < ApplicationPolicy
  def initialize(user, task)
    @user = user
    @task=task
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
    @user.writingbroker? ?  Business.find(@task.business_id).where(user_id:  @user.id).present? : @user.admin?

  end
  
  def show?
     @user.support? ?  Business.find(@task.business_id).business_users.where(user_id:  @user.id).present? : @user.admin?

   # @user.writingbroker? ? @task.business_id.business_users.where()
    #  @user.writingbroker? ?  @business.owner == @user : @user.admin?
     @user.writingbroker? ?  Business.find(@task.business_id).where(user_id:  @user.id).present? : @user.admin?

  end

  def destroy?
    @user.writingbroker? ?  Business.find(@task.business_id).where(user_id:  @user.id).present? : @user.admin?

  end
end
