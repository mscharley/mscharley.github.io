
require 'sass/plugin'
require 'compass'
require 'compass/commands'

module Jekyll
  class Compass < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)
      input = File.join(site.config['source'], '_sass')

      return unless File.exist? input

      config = {
          :project_path => site.config['source'],
          :http_path => '/',
          :sass_path => input,
          :css_path => File.join(site.config['destination'], 'css'),
          :images_path => File.join(site.config['source'], 'images'),
          :javascripts_path => File.join(site.config['destination'], 'js'),
          :line_comments => false,
          :environment => :production,
          :output_style => :compact,
          :quiet => true,
          :sass_options => {
              :unix_newlines => true,
          },
      }

      ::Compass.add_configuration(config, 'Jekyll::Compass')
      ::Compass::Commands::UpdateProject.new(site.config['source'], config).execute
    end
  end
end
