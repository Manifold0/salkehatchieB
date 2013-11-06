class User < ActiveRecord::Base

	#belongs_to :medical_form
	#has_one :whatever_form
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    if self.permission_level == 5
      return true
     else
      return false
     end
  end

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
    if self.permission_level == 1
      return true
    else
      return false
    end
  end



end

