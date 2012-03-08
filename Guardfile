# Check for SASS updates and push them locally and into any built site
guard 'sass', :input => 'sass', :output => 'css', :style => :compact
guard 'sass', :input => 'sass', :output => '_site/css', :style => :compact

# Check for any other updates and refresh Jekyll in that case
guard 'rake', :task => 'jekyll' do
  watch(%r{^(_includes/|_posts/|_layouts/|_config\.yml|robots.txt|[^/]*\.(?:html|markdown|textile))})
end

# vim: filetype=ruby
