
def bundle_exec(*args)
  sh 'bundle', 'exec', *args
end

def exec_bundle_exec(*args)
  exec 'bundle', 'exec', *args
end

desc 'Builds everything'
task :default => [:clean, :build]

desc 'Compiles site with Usmu'
task :build do
  bundle_exec 'usmu', 'generate', '--log', 'build.log'
end

desc 'Serves website locally for testing'
task :serve do
  bundle_exec 'usmu', 'serve'
end

desc 'Cleans out the old site'
task :clean do
  rm_rf 'site'
  rm_rf '.sass-cache'
  rm 'build.log' if File.exist? 'build.log'
end

desc 'Installs and sets up dependencies'
task :install do
  sh 'bundle', 'install'
  sh (File.exist?('node_modules') ? 'node_modules/bower/bin/bower' : 'bower'), 'install'
end

desc 'Deploy website to S3'
task :deploy => [:clean, :build] do
  bundle_exec 'usmu', 's3', 'deploy'
end
