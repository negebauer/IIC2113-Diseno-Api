module Admin
  class AdminController < ApplicationController
    before_action :verify_admin

    private

    def verify_admin
      return if current_user && current_user.has_role?(:admin)
      render json: { message: 'No tiene permisos para acceder a esta página.' },
             status: :unauthorized
    end
  end
end
