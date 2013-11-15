class Ability
  include CanCan::Ability

  def initialize(user)

    #IMPORTANT: Abilities further down will override a previous one. For example, if we have a can :manage, Camp
    #then a cannot :destroy, Camp, the user will be able to do anything except destroy the camp.

    #if admin, can do x
    if user.is_admin?
      can :manage, :all

      #can update camp assignments for all applicants
      can :update, CampAssignment
      #cannot assign camper unless payment has been made

      #cannot assign camper 18+ if they haven't passed background check

      #can assign camp directors

      #can print all campers, organized by camp, with contact information

      #can print all campers not assigned to a camp with 1st, 2nd, & 34d choices + contact info

      #can print all campers who haven't paid + their contact info

      #can print list of campers over 18 not flagged as passing background checks + their contact info

      #can print total number of adults (18+) and youth by camp, as well as total

    end

    if user.is_camp_director?
      #can update site assignments for their camp
      can :update_assignments, Camp
      #can :update, Site, current_user.camp_id =>
      can :read, Camp

      #can edit camper information for their camp only
      can :update, Camp

      #can print health information on all campers from that camp, organized by site
      can :print_health_info, Camp

      #print camp/site roster listings including name, church, age, gender, cell phone #
      can :roster_listing, Camp

      #can edit/update daily schedule for their camp only
      can :update, Schedule
    end

    if user.is_site_leader?
      #can view and print all camper information for their camp/site combination
      can :print_camper_information, Site

      #can edit/update daily schedule information for their camp/site combination only
      can :update, Schedule
      can :read, Camp
    end

    if user.is_parent?
      #can view photos from their child's camp only
      can :read, Photo
    end

    if user.is_camper?
      #can view daily schedule from their site only
      can :read, Schedule

      #can upload pictures, videos, and their blog entries for their site only
      can :read, Photo
      can :read, Camp
    end

  end

end