class CovenantPdf < Prawn::Document

  CHECKBOX        = "\xE2\x98\x90" # "☐"
  FILLED_CHECKBOX = "\xE2\x98\x91" # "☑"

  # To change this template use File | Settings | File Templates.
    def initialize()
      super(top_margin: 10)
    end

    def create_page(form)
      @form = form
      text "<b>Name:</b> #{@form.user.first_name}" + " #{@form.user.last_name}", :inline_format => true
      #stroke_horizontal_rule
      header
      intro
      statements
      questions
      agreement
      closing
    end

    def all_forms(users)
      users.each do |user|
        initialize(user.covenant_form)
        start_new_page
      end
    end

    def header
      move_down(10)
      text "#{DateTime.now.year} Salkehatchie Summer Service Covenant Statement Required by All", style: :bold, :size => 15
      move_down(5)
    end

    def intro
      move_down(5)
      text "Salkehatchie Summer Service is committed to providing a safe and secure environment for all children, youth, vulnerable adults, and volunteers who participate in its ministries. The following policy statements reflect my committment to preserving Salkehatchie Summer Service as a holy place of safety and protection for all who would participate and as a place in which all people can experience the love of God through relationships with others.", size: 12
    end

    def statements
      move_down(25)
      text "No adults who have been convicted of child abuse (either sexual abuse, physical abuse, or emotional abuse)
should volunteer to work with Salkehatchie Summer Service" + " \n \n Volunteers shall observe the 'Two-Adult Rule' at all times so that no adult is ever alone with youth." +
  "\n \n Volunteers shall attend regular training and educational events provided by the camp directors(s) to keep
informed of policies and state lawes regarding child abuse"     +
     "\n \n Volunteers shall immediately report any behavior that seems abusive or inappropriate to the camp director.", size: 10, style: :bold_italic, :align => :center
    end

  def questions
    move_down(30)
    #all policies
    if @form.policy
      text "As a volunteer, do you agree to observe and abide by all policies regarding working in ministries with children and youth?" +" <b>Yes</b>", :inline_format => true
    else
      text "As a volunteer, do you agree to observe and abide by all policies regarding working in ministries with children and youth?" +" <b>No</b>", :inline_format => true
    end

    move_down(4)
    #two adult rule
    if @form.two_adult
      text "As a volunteer, do you agree to observe the 'Two-Adult' rule at all times?" +" <b>Yes</b>", :inline_format => true
    else
      text "As a volunteer, do you agree to observe the 'Two-Adult' rule at all times?" +" <b>No</b>", :inline_format => true
    end

    move_down(4)
    #training
    if @form.training
      text "As a volunteer, do you agree to participate in training and education events related to your volunteer assignment if required?" +" <b>Yes</b>", :inline_format => true
    else
      text "As a volunteer, do you agree to participate in training and education events related to your volunteer assignment if required?" +" <b>Yes</b>", :inline_format => true
    end

    move_down(4)
    #report abuse
    if @form.report_abuse
      text "As a volunteer, do you agree to promptly report abusive or inappropriate behavior to the camp director?" +" <b>Yes</b>", :inline_format => true
    else
      text "As a volunteer, do you agree to promptly report abusive or inappropriate behavior to the camp director?" +" <b>No</b>", :inline_format => true
    end

    #child abuse
    move_down(4)
    if @form.child_abuse
      text "As a volunteer, do you agree to inform the camp direcot if you have ever been convicted of child abuse?" +" <b>Yes</b>", :inline_format => true
    else
      text "As a volunteer, do you agree to inform the camp direcot if you have ever been convicted of child abuse?" +" <b>No</b>", :inline_format => true
    end
  end

  def agreement
    move_down(30)
    text "I have read this Participant Covenant, and I agree to observe and abide by the policies set forth above.", :style => :italic
    move_down(10)
    text "<b>Signature: </b>" + "#{@form.user_signature}", :inline_format => true
    text "<b>Date: </b>" + "#{@form.signature_date}", :inline_format => true
  end

  def closing
    move_down(25)
    text "Please return these forms along with a <b>wallet</b> sized photo (not to be returned) <b>to the Camp Director</b> for the camp you are registered in by <b>May 25</b>.", :inline_format => true
    move_down(8)
    text "You can find the address these forms need to be mailed to at <b>www.salkehatchie.org.</b>", :inline_format => true
    move_down(8)
    text "<b>Do not mail these forms to the Conference Office.</b>", :inline_format => true
    move_down(8)
    text "You are reminded that the Camp Directors will make the final decision as to <b>which camp you will attend</b>", :inline_format => true
  end

end