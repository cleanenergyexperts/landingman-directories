require "middleman-core"

Middleman::Extensions.register :landingman_directories do
  require "landingman-directories/extension"
  ::Landingman::DirectoriesExtension
end
