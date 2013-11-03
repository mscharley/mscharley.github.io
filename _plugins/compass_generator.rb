
require 'sass/plugin'
require 'compass'
require 'compass/commands'
require 'fileutils'

module Jekyll
  class CompassFile < StaticFile
    def write(destination)
      # Short-circuit to the inevitable
      false
    end
  end

  class Compass < Generator
    safe true
    priority :high

    def generate(site)
      input = File.join(site.source, '_sass')

      return unless File.exist? input
      puts

      output = File.join(site.config['destination'], 'css')
      if File.exist? output
        puts "Deleting existing CSS content..."

        site.static_files = site.static_files.select do |p|
          if p.path.index(output)
            File.delete p.path
            false
          else
            true
          end
        end
      end

      config = {
          :project_path => site.source,
          :http_path => '/',
          :sass_path => input,
          :css_path => output,
          :images_path => File.join(site.source, 'images'),
          :javascripts_path => File.join(site.source, 'js'),
          :line_comments => false,
          :environment => :production,
          :output_style => :compact,
          #:quiet => true,
          :sass_options => {
              :unix_newlines => true,
          },
      }

      ::Compass.add_configuration(config, 'Jekyll::Compass')
      ::Compass.configuration.on_sprite_saved do |filename|
        site.static_files << StaticFile.new(site, site.source, File.dirname(filename)[site.source.length..-1], File.basename(filename))
      end
      ::Compass.configuration.on_stylesheet_saved do |filename|
        source = site.config['destination']
        site.static_files << CompassFile.new(site, source, File.dirname(filename)[source.length..-1], File.basename(filename))
      end

      # Manually mangle the output directory to keep it in sync with what Compass expects and Jekyll produces
      ::Compass.configuration.on_sprite_removed do |filename|
        site.static_files = site.static_files.select do |p|
          if p.path == filename
            sprite_output p.destination(site.config['destination'])
            File.delete sprite_output if File.exist? sprite_output
            false
          else
            true
          end
        end
      end

      compiler = ::Compass::Commands::UpdateProject.new(site.config['source'], config).new_compiler_instance

      compiler.run
      nil
    end
  end
end
