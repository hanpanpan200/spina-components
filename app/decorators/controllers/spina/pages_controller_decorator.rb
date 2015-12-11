module Spina
  PagesController.class_eval do

    private

    def components
      component.order('created_at DESC')
    end
    helper_method :components

    def components_page_path
      Page.where(view_template: 'components').first.try(:materialized_path)
    end
    helper_method :components_page_path
  end
end