
desc "Builds everything"
task :default => [:sass, :jekyll]

desc "Builds all SASS scripts"
task :sass do
  sh 'sass', '--update', 'sass:_site/css'
end

desc "Compiles site with Jekyll for testing"
task :jekyll do
  sh 'jekyll', '--pygments', '--safe'
end
