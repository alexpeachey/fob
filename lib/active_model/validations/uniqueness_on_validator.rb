module ActiveModel
  module Validations
    class UniquenessOnValidator < EachValidator
      def validate_each(record, attr_name, value)
        klass = options[:class_name].to_s.camelcase.constantize
        if klass.exists?(attr_name.to_sym => value)
          record.errors.add(attr_name, :taken, filtered_options)
        end
      end

      def filtered_options
        options.except(:class_name)
      end
    end
  end
end
