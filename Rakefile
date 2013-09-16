require "bundler/gem_tasks"

task :default => :specs

desc "Run all specs"
task :specs do
  system "rspec"
end

desc "Run all specs with long output"
task :verbose do
  system "rspec", "-f", "d"
end


