namespace :service do
  desc "Run service tests"
  task :test do
    system("bundle exec rspec ./spec/services")
  end
end
