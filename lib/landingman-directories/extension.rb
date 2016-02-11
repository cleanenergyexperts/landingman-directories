# Require core library
require 'middleman-core'

module Landingman
  class DirectoriesExtension < ::Middleman::Extension
    option :css_dir,    'assets/stylesheets', 'Stylesheets Directory'
    option :js_dir,     'assets/javascripts', 'JavaScripts Directory'
    option :images_dir, 'assets/images',      'Images Directory'
    option :fonts_dir,  'assets/fonts',       'Fonts Directory'
    option :layouts_dir,'layouts',            'Layouts Directory'

    def initialize(app, options_hash={}, &block)
      super
      self.configure_paths
    end

    # def after_configuration
    #   self.configure_paths
    # end

  protected

    def configure_paths
      app.config[:css_dir]      = options.css_dir
      app.config[:js_dir]       = options.js_dir
      app.config[:images_dir]   = options.images_dir
      app.config[:fonts_dir]    = options.fonts_dir
      app.config[:layouts_dir]  = options.layouts_dir
    end
  end
end