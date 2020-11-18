class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end
 
  def new?
    return true if user.present? && user.admin?
  end
  
  def create?
    return true if user.present? && user.admin?
  end

  def show?
    user.present?
  end
 
  def update?
    return true if user.present? && user.admin?
  end
 
  def destroy?
    return true if user.present? && user.admin?
  end
 
  private
 
    def article
      record
    end
end