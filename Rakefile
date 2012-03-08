require 'date'

desc "Builds everything"
task :default => [:clean, :sass, :jekyll]

desc "Builds Jekyll in a clean environment"
task :'jekyll-clean' => [:clean, :jekyll]

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

desc "Create a new post"
task :post, :title do |t, args|
  title = args[:title]
  title || begin
    puts "Usage: You must specify a title: rake post'[Hello world!]'"
    return 1
  end

  # Sanitize our title and generate other data
  safe_title = title.downcase.gsub(/[^a-z0-9]+/, '-').squeeze('-').gsub(/\A-+|-+\z/, '')
  date = Date.today.strftime '%Y-%m-%d'
  file = "_posts/#{date}-#{safe_title}.markdown"

  # Actually generate the new branch and file
  git "checkout", "-b", "drafts/#{safe_title}", "master"
  sh 'mkdir', '_posts'
  sh "touch", file
  git "add", "-N", file
  puts "Writing headers..."
  File.open(file, 'w') do |draft|
    draft.puts <<TEMPLATE
---
title: #{title}
layout: post
---

TEMPLATE
  end

  # Open the file for editing. At this point, we are done so exec out so
  # rake can't whine too much if we screw up our editor
  editor = ENV['EDITOR'] || 'vi'
  exec editor, file
end

desc "Publishes the currently checked out draft branch to master"
task :publish do
  # git checkout master
  # git merge --squash -m "Publishing title" drafts/blargh
end

def git(*args)
  sh 'git', *args
end
