class User < ActiveRecord::Base

  has_many :camp_assignments
  has_many :camp_requests
  has_one :covenant_form
  has_one :questionnaire
  has_many :reference_forms
  has_one :medical_form

  mount_uploader :photoID, ImageUploader

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

  def is_camp_director_for_camp(camp)
    self.current_camps_assigned.each do |assignment|
      if assignment.camp == camp
        if assignment.permission_level == 4
          return true
        end
        return false
      end
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
    return !is_admin?
  end
  def current_camps_requested
    requests = Array.new()
    self.camp_requests.each do |camp_request|
      if camp_request.created_at.year == DateTime.now.year
        requests.push(camp_request)
      end
    end
    return requests
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
    num_camps = current_camps_requested.count

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

  def questionnaire_up_to_date
    current_year = Time.now.year
    if self.questionnaire != nil
      if self.questionnaire.user_approval_date.year == current_year
        return true
      end
    end
    return false
  end

  def reference_forms_up_to_date
    current_year = Time.now.year
    if self.reference_forms.count > 2
      self.reference_forms.each do |reference|
        if reference.reviewed_by_camp_director
          if reference.user_approval_date.year != current_year
            return false
          end
        else
          return false
        end
      end
    else
      return false
    end
    return true
  end

  def medical_form_up_to_date
    current_year = Time.now.year
    if self.medical_form != nil
      if self.medical_form.guardian_approval_date.year == current_year
        return true
      end
    end
    return false
  end

  def full_name
    return "#{last_name}, #{first_name}"
  end

  def under_eighteen?
    return self.age < 18
  end

  def age
    if self.date_of_birth == nil
      return 0
    end
    dob = self.date_of_birth
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

=begin  def age
    if (self.date_of_birth == nil)
      return 0;
    end
    return self.date_of_birth.to_int/(60*60*24*365)
  end
=end

  def background_check_valid?
    if self.background_check
      latest_date = Time.now.year - 5 #TO-DO more specificity.
      return (self.background_check_date.year > latest_date)
    end
    return false
  end
end

