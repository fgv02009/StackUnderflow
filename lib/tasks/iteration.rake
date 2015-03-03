task :iteration => :environment do
 #sum all of karma points
 #sort
  users = User.all
  users.each do |user|
    user.update_attribute("voted_q", user.voted_questions)
  end

end
