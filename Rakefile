
def bundle_exec(*args)
  sh 'bundle', 'exec', *args
end

def exec_bundle_exec(*args)
  exec 'bundle', 'exec', *args
end

desc "Builds everything"
task :default => [:clean, :build]

desc "Compiles site with Usmu for testing"
task :build do
  bundle_exec 'usmu', 'generate', '--trace'
end

desc "Cleans out the old site"
task :clean do
  rm_rf 'site'
  rm_rf '.sass-cache'
end

desc "Installs and sets up dependencies"
task :install do
  sh 'bundle', 'install'
  sh 'bower', 'install'
end

desc "Deploy website to S3"
task :deploy => [:clean, :jekyll] do
  bundle_exec 's3_website', 'push', '--site=site'
end
