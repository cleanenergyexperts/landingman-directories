# Require core library
require 'middleman-core'

module Landingman
  class DirectoriesExtension < ::Middleman::Extension
    option :css_dir,    'assets/stylesheets', 'Stylesheets Directory'
    option :js_dir,     'assets/javascripts', 'JavaScripts Directory'
    option :images_dir, 'assets/images',      'Images Directory'
    option :fonts_dir,  'assets/fonts',       'Fonts Directory'
    option :partials_dir,'partials',          'Partials Directory'
    option :layouts_dir,'layouts',            'Layouts Directory'

    def initialize(app, options_hash={}, &block)
      super
      self.configure_paths
    end

  protected

    def configure_paths
      app.config[:css_dir]      = options.css_dir
      app.config[:js_dir]       = options.js_dir
      app.config[:images_dir]   = options.images_dir
      app.config[:fonts_dir]    = options.fonts_dir

      # Use _partials if partials doesn't exist
      # Only applies to Middleman 3 (partials always come from the root in Middleman 4)
      if options.partials_dir == 'partials' &&
        !Dir.exist?(File.join(app.root, 'source', 'partials')) &&
        Dir.exist?(File.join(app.root, 'source', '_partials')) then
        app.config[:partials_dir] = '_partials'
      else
        app.config[:partials_dir] = options.partials_dir
      end

      # Use _layouts if layouts doesn't exist
      if options.layouts_dir == 'layouts' &&
        !Dir.exist?(File.join(app.root, 'source', 'layouts')) &&
        Dir.exist?(File.join(app.root, 'source', '_layouts')) then
        app.config[:layouts_dir] = '_layouts'
      else
        app.config[:layouts_dir] = options.layouts_dir
      end
    end
  end
end