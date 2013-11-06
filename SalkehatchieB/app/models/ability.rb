class Ability
  include CanCan::Ability

  def initialize(user)
    #if admin, can do x
    if user.is_admin?
      can :manage, :all
    end

    if user.is_camp_director?
      can :manage, Camp, current_user.camp_id => camp_id
      can :update_assignments, Camp
      can :manage_campers, Camp
      can :print_health_info, Camp
      can :print_roster_listing, Camp
      can :update_schedule, Camp
      can :update, Schedule, current_user.camp_id => schedule.camp_id
    end

    if user.is_site_leader?
      can :print_camper_information, Site
      can :update
    end

    if user.is_parent?

    end

    if user.is_camper?
      can :read, Photo, :user.site => user.site
    end


  end