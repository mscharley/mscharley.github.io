
desc "Builds everything"
task :default => [:sass, :jekyll]

desc "Builds all SASS scripts"
task :sass do
  sh 'sass', '-C', '-f', '-t', 'compact', '--update', 'sass:src/css'
end

desc "Compiles site with Jekyll for testing"
task :jekyll do
  sh 'jekyll', '--pygments', '--safe'
end
