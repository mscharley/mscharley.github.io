
desc "Builds everything"
task :default => [:clean, :sass, :jekyll]

desc "Builds all SASS scripts"
task :sass do
  sh 'sass', '-C', '-f', '-t', 'compact', '--update', 'sass:css'
end

desc "Compiles site with Jekyll for testing"
task :jekyll do
  sh 'jekyll', '--pygments', '--safe'
end

desc "Cleans out the old site"
task :clean do
  sh 'rm', '-rf', '_site'
end
