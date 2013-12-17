class QuestionnairePdf < Prawn::Document

  def initialize()
    super(top_margin: 10)
  end


  def create_page(form)
    @form = form
    #stroke_horizontal_rule
    top
    move_down(5)
    reminder
    move_down(10)
    info
    move_down(5)
    explanation
    move_down(50)
    gifts_and_graces
    move_down(12)
    cpr
    move_down(20)
    previous_experience
    move_down(15)
    activities
    move_down(45)
    closing
  end

  def all_forms(users)
    users.each do |user|
      initialize(user.medical_form)
      start_new_page
    end
  end


  def top
    text "I. SALKEHATCHIE SUMMER SERVICE" +
    "\n Volunteer Interview / Questionnaire Form", :style => :bold, :size => 19, :align => :center
  end

  def reminder
    text "Please return this form along with a wallet sized photo (no return) to the Camp Director indicated" +
    " on the cover letter by May 25. You are reminded that the Camp Directors will make the final decision" +
    " as to which camp you will attend.", :style => :italic
  end

  def info
    text "Name <u>#{@form.user.first_name}" + " #{@form.user.last_name}</u>"+ " \n Occupation(Adults) <u>#{@form.occupation}</u>", :inline_format => true
  end

  def explanation
    text "Why have you chosen to participate in Salkehatchie Summer Service?" + " <u>#{@form.why_participate}</u>", :inline_format => true
  end

  def gifts_and_graces
    text "Please give us an indication of your gifts and graces in terms of skill.", :size => 14, :style => :italic
    move_down(15)

    #carpentry
    if @form.carpentry == 0
      text "<b>Carpentry:</b> None", :inline_format => true
    elsif @form.carpentry == 1
      text "<b>Carpentry:</b> Some", :inline_format => true
    elsif @form.carpentry == 2
      text "<b>Carpentry:</b> Skilled", :inline_format => true
    elsif @form.carpentry >= 3
      text "<b>Carpentry:</b> Very Skilled", :inline_format => true
    end

    #plumbing
    if @form.plumbing == 0
      text "<b>Plumbing:</b> None", :inline_format => true
    elsif @form.plumbing == 1
      text "<b>Plumbing:</b> Some", :inline_format => true
    elsif @form.plumbing == 2
      text "<b>Plumbing:</b> Skilled", :inline_format => true
    elsif @form.plumbing >= 3
      text "<b>Plumbing:</b> Very Skilled", :inline_format => true
    end

    #electrical
    if @form.electrical == 0
      text "<b>Electrical:</b> None", :inline_format => true
    elsif @form.electrical == 1
      text "<b>Electrical:</b> Some", :inline_format => true
    elsif @form.electrical == 2
      text "<b>Electrical:</b> Skilled", :inline_format => true
    elsif @form.electrical >= 3
      text "<b>Electrical:</b> Very Skilled", :inline_format => true
    end

    #roofing
    if @form.roofing == 0
      text "<b>Roofing:</b> None", :inline_format => true
    elsif @form.roofing == 1
      text "<b>Roofing:</b> Some", :inline_format => true
    elsif @form.roofing == 2
      text "<b>Roofing:</b> Skilled", :inline_format => true
    elsif @form.roofing >= 3
      text "<b>Roofing:</b> Very Skilled", :inline_format => true
    end

    #song leader
    if @form.song_leader == 0
      text "<b>Song Leader:</b> None", :inline_format => true
    elsif @form.song_leader == 1
      text "<b>Song Leader:</b> Some", :inline_format => true
    elsif @form.song_leader == 2
      text "<b>Song Leader:</b> Skilled", :inline_format => true
    elsif @form.song_leader >= 3
      text "<b>Song Leader:</b> Very Skilled", :inline_format => true
    end


    #bible
    if @form.bible == 0
      text "<b>Bible:</b> None", :inline_format => true
    elsif @form.bible == 1
      text "<b>Bible:</b> Some", :inline_format => true
    elsif @form.bible == 2
      text "<b>Bible:</b> Skilled", :inline_format => true
    elsif @form.bible >= 3
      text "<b>Bible:</b> Very Skilled", :inline_format => true
    end

    #recreation
    if @form.recreation == 0
      text "<b>Recreation:</b> None", :inline_format => true
    elsif @form.recreation == 1
      text "<b>Recreation:</b> Some", :inline_format => true
    elsif @form.recreation == 2
      text "<b>Recreation:</b> Skilled", :inline_format => true
    elsif @form.recreation >= 3
      text "<b>Recreation:</b> Very Skilled", :inline_format => true
    end

    #life guard
    if @form.lifeguard == 0
      text "<b>Life guard:</b> None", :inline_format => true
    elsif @form.lifeguard == 1
      text "<b>Life guard:</b> Some", :inline_format => true
    elsif @form.lifeguard == 2
      text "<b>Life guard:</b> Skilled", :inline_format => true
    elsif @form.lifeguard >= 3
      text "<b>Life guard:</b> Very Skilled", :inline_format => true
    end

    #accounting
    if @form.accounting == 0
      text "<b>Keeping Financial Records:</b> None", :inline_format => true
    elsif @form.accounting == 1
      text "<b>Keeping Financial Records:</b> Some", :inline_format => true
    elsif @form.accounting == 2
      text "<b>Keeping Financial Records:</b> Skilled", :inline_format => true
    elsif @form.accounting >= 3
      text "<b>Keeping Financial Records:</b> Very Skilled", :inline_format => true
    end

    #first aid
    if @form.firstaid == 0
      text "<b>First Aid:</b> None", :inline_format => true
    elsif @form.firstaid == 1
      text "<b>First Aid:</b> Some", :inline_format => true
    elsif @form.firstaid == 2
      text "<b>First Aid:</b> Skilled", :inline_format => true
    elsif @form.firstaid >= 3
      text "<b>First Aid:</b> Very Skilled", :inline_format => true
    end
  end

  def cpr
    if @form.cpr_firstaid
      text "Are you currently certified in CPR and First Aid from a nationally recognized body such as the American Red" +
      "Cross?" + "<b> Yes</b>", :inline_format => true
    else
      text "Are you currently certified in CPR and First Aid from a nationally recognized body such as the American Red" +
      "Cross?" + " No"
    end

  end

  def previous_experience
    #need for each loop here

    text "Please list any previous Salkehatchie Experience(s): " + "<b>#{@form.camp}" + " #{@form.year}</b>", :inline_format => true
  end

  def activities
    text "Please share with us activities at school, church, and in your community in which you are involved: " +
    "<u> #{@form.involved_activities} </u>", :inline_format => true
  end


  def closing
    text "<b>Volunteer: </b>" + " #{@form.user.first_name}" + " #{@form.user.last_name}" + "\n <b> Date:</b>" + " #{@form.user_approval_date}", :inline_format => true
    move_down(15)
    if @form.camp_director_approval
      text "<b>Reviewed by Camp Director?</b>" + " Yes", :inline_format => true
    else
      text "<b>Reviewed by Camp Director?</b>" + " No", :inline_format => true
    end
    text "<b>Date: </b> " + "#{@form.camp_director_approval_date}", :inline_format => true
  end


end
