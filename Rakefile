
desc "Builds everything"
task :default => [:clean, :jekyll]

desc "Compiles site with Jekyll for testing"
task :jekyll do
  sh 'jekyll', 'build'
end

desc "Cleans out the old site"
task :clean do
  rm_rf 'build'
  rm_rf '.sass-cache'
end

desc "Installs and sets up dependencies"
task :install do
  sh 'bundle', 'install'
  sh 'bower', 'install'
end

desc "Deploy website to S3"
task :deploy => [:clean, :jekyll] do
  sh 's3_website', 'push', '--site=build'
end
