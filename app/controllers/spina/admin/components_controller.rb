module Spina
  module Admin
    class ComponentsController < AdminController
      before_filter :set_breadcrumb
      after_action :set_component_template, only: ['new', 'edit', 'create', 'update']

      layout "spina/admin/website"

      def show
        @component = Component.find(params[:id])
      end

      def index
        @components = Component.all
      end

      def new
        add_breadcrumb "New component", spina.new_admin_component_path

        @component = Component.new
      end

      def edit
        @component = Component.find(params[:id])
        add_breadcrumb @component.name
      end

      def create
        @component = Component.new(component_params)

        add_breadcrumb "New component"
        if @component.save
          redirect_to spina.admin_components_url, notice: "Component has been created."
        else
          render :new
        end
      end

      def update
        @component = Component.find(params[:id])

        add_breadcrumb @component.name
        if @component.update_attributes(component_params)
          @component.param_data = eval(component_params[:param_data])
          @component.save!
          redirect_to spina.admin_components_url, notice: "Component #{@component.name} has been updated."
        else
          render :edit
        end
      end

      def destroy
        @component = Component.find(params[:id])
        @component.destroy
        redirect_to spina.admin_components_url, notice: "The component has beed destroyed."
      end

      private

      def set_breadcrumb
        add_breadcrumb "Components", spina.admin_components_path
      end

      def set_component_template
        @component.is_template = true
      end
      def component_params
        params.require(:component).permit(:name, :param_data, :use_for, :file_path, :content)
      end
    end
  end
end