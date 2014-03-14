module Ldmc
  class ApplicationController < ActionController::Base
    check_authorization :unless => :devise_controller?
    before_filter :merge_abilities
    layout 'application'

    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to main_app.root_path, :alert => exception.message
    # end

    private

    def merge_abilities
      current_ability.merge(Ldmc::Ability.new(current_user))
    end

  end
end
