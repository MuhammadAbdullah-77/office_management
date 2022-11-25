class Admin::BasePolicy < ApplicationPolicy
    def has_permissions?(admin, name)
      Rails.cache.read("permission#{user.id}").include?(name)
    end
  end