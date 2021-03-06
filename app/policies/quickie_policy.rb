class QuickiePolicy
  attr_reader :current_user, :quickie

  def initialize(current_user, quickie)
    @current_user = current_user
    @quickie = quickie
  end

  def show?
    true
  end

  def new?
    @current_user
  end

  def create?
    new?
  end

  def edit?
    @current_user and ( @current_user.admin? or @quickie.creator == @current_user )
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end
