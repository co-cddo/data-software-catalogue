class OrganisationPolicy < ApplicationPolicy
  def admin?
    user&.admin?
  end

  def admin_or_users_organisation?
    return unless user

    user.admin? || record == user.organisation
  end

  def anyone?
    true
  end

  alias_method :index?, :anyone?
  alias_method :show?, :anyone?
  alias_method :create?, :admin?
  alias_method :new?, :admin?
  alias_method :edit?, :admin_or_users_organisation?
  alias_method :update?, :admin_or_users_organisation?
  alias_method :destroy?, :admin_or_users_organisation?
end
