class ReferencePdf < Prawn::Document

  def initialize()
    super(top_margin: 10)
  end

  def create_page(form)
    @form = form
    #stroke_horizontal_rule
    heading
    reference
  end

  def all_forms(users)
    users.each do |user|
      initialize(user.reference_forms)
      start_new_page
    end
  end


  def heading
    text "2013 SALKEHATCHIE SUMMER SERVICE REFERENCE FORM FOR PARTICIPANTS 18 YEARS OLD OR OLDER", :align => :center, style: :bold
    move_down(5)
    text "<b>Applicant's Name:</b> "  + "#{@form.user.first_name}" + " #{@form.user.last_name} ", :inline_format => true
    move_down(15)
    text "Salkehatchie Summer Service is a pioneering servant ministry at selected sites in South Carolina, North Carolina and Georgia involving high school and college age youth, adult community leaders and persons of different cultures in upgrading housing, motivating community cooperative efforts by helping persons to help themselves, and providing all participants with opportunities for personal growth and service."
    move_down(15)
    text "Salkehatchie Summer Service is for high school and college age youth drawn primarily from the South Carolina United Methodist Conference. Participants must be at least 14 years old by the beginning of the camp they attend. Adult leaders are also needed to offer guidance and support."
    move_down(15)
    text "The above applicant is required by the South Carolina Conference to receive three references prior to being accepted for service. Please review the below information and indicate whether you would recommend this applicant to attend an intense Saturday to Saturday experience with Salkehatchie Summer Service."
    move_down(15)
    text "• I have known the applicant for at least six months.
	• I recommend the applicant to work with youth and adults.
	• I would willingly work along the side of the applicant in such a ministry
	• I would recommend the above applicant attend Salkehatchie.
	• I understand that I may forward any additional comments about the above applicant to Salkehatchie@umcsc.org. Any additional information I provide will be shared with the appropriate camp director."
  end

  def reference
    move_down(100)

    #for each reference, create these...
    text "<b>Reference Name:</b>"  + " #{@form.name}", :inline_format => true
    #insert name
    text "<b>Address:</b>", :inline_format => true
    #insert adress
    text "<b>Phone:</b>", :inline_format => true
    #insert phone
    text "<b>Email Address:</b>"  + " #{@form.email}", :inline_format => true
    #insert email address
    text "<b>Signature:</b>", :inline_format => true
    #insert signature
    text "<b>Relationship:</b>" + " #{@form.relationship}", :inline_format => true
    #insert relationship
    move_down(15)
    text "<b>Reviewed by (Camp Director): </b>" + " #{@form.reviewed_by_camp_director}", :inline_format => true
    #insert name
    text "<b>Signature:</b>", :inline_format => true
    #insert signature
    text "<b>Date:</b>", :inline_format => true
    #insert date
  end
end
