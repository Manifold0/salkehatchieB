class User < ActiveRecord::Base

  has_many :camp_assignments
  has_one :covenant_form

	#belongs_to :medical_form
	#has_one :whatever_form
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    if self.permission_level == 5
      return true
     else
      return false
     end
  end

  #Example of how to do abilities with camp_assignment model
  #def is_camp_director?
  # if self.camp_assignment.permission_level == 4
  #etc., etc.

  def is_camp_director?
    if self.permission_level == 4
      return true
    else
      return false
    end
  end

  def is_site_leader?
    if self.permission_level == 3
      return true
    else
      return false
    end
  end

  def is_parent?
    if self.permission_level == 2
      return true
    else
      return false
    end
  end

  def is_camper?
    #current_camp_assignment?
    if self.permission_level == 1
      return true
    else
      return false
    end
  end

  def current_camp_assignment
    self.camp_assignments.each do |camp_assignment|
      if camp_assignment.camp.start_date.year == DateTime.now.year
        return camp_assignment
      end
    end
  end
  def site
    return current_camp_assignment.site
  end
  def current_camps_assigned
    assignments = Array.new()
    self.camp_assignments.each do |camp_assignment|
      if camp_assignment.camp.start_date.year == DateTime.now.year
        assignments.push(camp_assignment)
      end
    end
    return assignments
  end

  def current_balance
    current_year = Time.now.year
    payment = Payment.where(user_id:self.id,year:current_year).sum(:amount)
    
    current_cost = Cost.where(year:current_year).sum(:amount)
    num_camps = current_camps_assigned.count

    @balance = (current_cost*num_camps) - payment
  end

  def covenant_form_up_to_date
    current_year = Time.now.year
    if self.covenant_form != nil
      if self.covenant_form.signature_date.year == current_year
        return true
      end
    end
    return false
  end

  def full_name
    return "#{last_name}, #{first_name}"
  end
end

