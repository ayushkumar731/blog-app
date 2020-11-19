task :new_task => :environment do
  Article.where('created_at').find_each do |a|
    a.created_at= DateTime.now.to_date-365
    a.save
  end
end