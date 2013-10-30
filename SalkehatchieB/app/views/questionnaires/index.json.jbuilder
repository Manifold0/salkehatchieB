json.array!(@questionnaires) do |questionnaire|
  json.extract! questionnaire, :occupation, :why_participate, :carpentry, :plumbing, :electrical, :roofing, :song_leader, :bible, :recreation, :lifeguard, :accounting, :firstaid, :cpr_firstaid, :camp, :year, :site_leader, :involved_activities, :camp_director_approval, :camp_director_approval_date, :user_approval, :user_approval_date, :printed_date, :user_id
  json.url questionnaire_url(questionnaire, format: :json)
end
