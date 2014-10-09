require 'active_model/validations/uniqueness_on_validator'

module Fob

  class Fob
    include Virtus.model
    extend  ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def self.represents(name, options={})
      include_model(name, options)
      klass = name.to_s.camelcase
      singleton_class.instance_eval do
        define_method(:model_name) do
          ::ActiveModel::Name.new(self, nil, "#{klass}")
        end
      end
    end

    def self.has_one(name, options={})
      include_model(name, options)
    end

    def initialize(*args, &block)
      super
      @persisted = false
    end

    def save
      @persisted = yield attributes
    end

    def persisted?
      @persisted
    end

    private
    def self.include_model(name, options)
      class_eval("def #{name.to_s};@#{name.to_s};end")
      class_eval("def #{name.to_s}=(val);@#{name.to_s}=val;end")
      if options[:with]
        delegate *(options[:with]), to: name
      end
    end
  end

end
