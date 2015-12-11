module Spina
  module Components
    include ActiveSupport::Configurable

    config_accessor :title, :controller, :description, :spina_icon, :plugin_type

    self.title = 'Component'
    self.controller = 'components'
    self.description = 'To create component yourself'
    self.spina_icon = 'pencil-outline'

    self.plugin_type = 'website_resource'
  end
end