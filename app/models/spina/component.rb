module Spina
  class Component < ActiveRecord::Base
    has_many :page_parts, as: :page_partable
    has_many :structure_parts, as: :structure_partable
    
    validates :name, presence: true, uniqueness: true

    before_save :create_component_template
    after_destroy :destroy_component_template

    private
    def create_component_template
      path = Rails.root.join('app', 'assets', 'javascripts','default','js','components', "#{self.name}.es6.jsx")
      File.open(path, 'w+') do |f|
        f.write(self.content)
      end   
      self.file_path = path
    end

    def destroy_component_template
      File.delete(self.file_path) if File.exist?(self.file_path)      
    end
  end
end