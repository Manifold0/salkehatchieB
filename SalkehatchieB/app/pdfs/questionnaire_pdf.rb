class QuestionnairePdf < Prawn::Document

  def initialize(form)
    super(top_margin: 10)
    @form = form
    #stroke_horizontal_rule
    top
    move_down(5)
    reminder
    move_down(10)
    info
    move_down(5)
    explanation
    move_down(10)
    gifts_and_graces
    move_down(2)
    cpr
    move_down(10)
    previous_experience
    move_down(15)
    activities
    move_down(15)
    closing
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
    text "Name <u>#{@form.user.first_name}" + " #{@form.user.last_name}</u>"+ " Occupation(Adults) <u>#{@form.occupation}</u>", :inline_format => true
  end

  def explanation
    text "Why have you chosen to participate in Salkehatchie Summer Service?" + " <u>#{@form.why_participate}</u>", :inline_format => true
  end

  def gifts_and_graces
    text "Please give us an indication of your gifts and graces"
    move_down(5)

    #carpentry
    if @form.carpentry >= 0
      text "Carpentry: None"
    elsif @form.carpentry >= 3  && @form.carpentry < 6
      text "Carpentry: Some"
    elsif @form.carpentry >= 6
      text "Carpentry: Skilled"
    elsif @form.carpentry > 6
      text "Carpentry: Very Skilled"
    end

    text "Plumbing: " + "#{@form.carpentry}"

    text "Plumbing: " + "#{@form.plumbing}"
    text "Electrical: " + "#{@form.electrical}"
    text "Roofing: " + "#{@form.roofing}"
    text "Song Leader: " + "#{@form.song_leader}"
    text "Bible: " + "#{@form.bible}"
    text "Recreation: " + "#{@form.recreation}"
    text "Life guard: " + "#{@form.lifeguard}"
    text "Keeping Financial Records: " + "#{@form.accounting}"
    text "First Aid: " + "#{@form.firstaid}"
  end

  def cpr
    text "Are you currently certified in CPR and First Aid from a nationally recognized body such as the American Red" +
    "Cross?" + " #{@form.cpr_firstaid}"
  end

  def previous_experience
    text "Please list any previous Salkehatchie Experience(s):"
  end

  def activities
    text "Please share with us activities at school, church, and in your community in which you are involved: " +
    "<u> #{@form.involved_activities} </u>", :inline_format => true
  end


  def closing
    text "Volunteer" + "<u> #{@form.user.first_name}" + " #{@form.user.last_name}</u>" + " Date" + "<u> #{@form.user_approval_date}</u>", :inline_format => true
    text "Reviewed by Camp Director?" + " #{@form.camp_director_approval}" + " Date" + "<u> #{@form.camp_director_approval_date}</u>", :inline_format => true
  end


end
