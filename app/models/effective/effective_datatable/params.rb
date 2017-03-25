module Effective
  module EffectiveDatatable
    module Params

      private

      def datatables_ajax_request?
        view && view.params[:draw] && view.params[:columns] && view.params[:id] == to_param
      end

      def params
        return {} unless view.present?
        @params ||= {}.tap { |params| view.params.each { |k, v| params[k.to_sym] = v } }
      end

      def filter_params
        params.select { |name, value| _filters.key?(name.to_sym) }
      end

      def scope_param
        params[:scope].to_sym if params.key?(:scope)
      end

      def search_params
        params.select { |name, value| columns.key?(name) && (name != :id || value != to_param) }
      end

    end
  end
end
