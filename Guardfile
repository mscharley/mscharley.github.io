# Check for SASS updates and push them locally and into any built site

guard :compass, compile_on_start: true

# Check for any other updates and refresh Jekyll in that case
guard 'rake', :task => 'jekyll' do
  watch(%r{^(_includes/|_posts/|_layouts/|_config\.yml|robots.txt|[^/]*\.(?:html|markdown|textile))})
end

# TODO: Watch for JS file changes and rebuild the JS section
# TODO: Implement jsmin of some type

# vim: filetype=ruby
