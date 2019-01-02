namespace :dev do
  desc 'test'
  task test: :environment do
    data = InaturalistService.observations("desc", "created_at", 1)
  end
end