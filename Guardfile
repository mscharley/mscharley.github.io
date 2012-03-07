# Check for SASS updates and push them locally and into any built site
guard 'sass', :input => 'sass', :output => 'css'
guard 'sass', :input => 'sass', :output => '_site/css'

# Check for any other updates and refresh Jekyll in that case
guard 'rake', :task => 'jekyll' do
  watch(%r{^(_includes/|_posts/|_layouts|[^/]*\.(?:html|markdown|textile))})
end

# vim: filetype=ruby
