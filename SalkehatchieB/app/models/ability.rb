class Ability
  include CanCan::Ability

  def initialize(user)
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
      can :update_assignments, Camp, current_user.camp_id => camp_id

      #can edit camper information for their camp only
      can :manage_campers, Camp

      #can print health information on all campers from that camp, organized by site
      can :print_health_info, Camp

      #print camp/site roster listings including name, church, age, gender, cell phone #
      can :print_roster_listing, Camp

      #can edit/update daily schedule for their camp only
      can :update, Schedule, current_user.camp_id => schedule.camp_id
    end

    if user.is_site_leader?
      #can view and print all camper information for their camp/site combination
      can :print_camper_information, Site

      #can edit/update daily schedule information for their camp/site combination only
      can :update, Schedule, :user.site => user.site
    end

    if user.is_parent?
      #can view photos from their child's camp only
      can :read, Photo, :user.camp => user.camp
    end

    if user.is_camper?
      #can view daily schedule from their site only
      can :read, Schedule, current_user.camp_id => schedule.camp_id

      #can upload pictures, videos, and their blog entries for their site only
      can :read, Photo, :user.site => user.site  #temporary
    end


  end