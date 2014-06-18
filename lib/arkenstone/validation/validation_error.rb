module Arkenstone
  module Validation
    # ValidationError wraps up any error messages encountered during validation. They are stored in a hash that is keyed off of an attribute. The value for the key is an array of error messages associated with that attribute.
    class ValidationError

      attr_accessor :messages

      ### Creates the initial hash.
      def initialize
        @messages = {}
      end

      def count
        @messages.count
      end

      def [](key)
        @messages[key]
      end

      def []=(key, val)
        @messages[key] = val
      end

      ### Adds an error message associated with the attribute. If this is the first message for the attribute, a new array is created to contain the messages.
      def add(attr, message)
        errors_for_attr = @messages[attr]
        if errors_for_attr.nil?
          @messages[attr] = [message]
        else
          errors_for_attr << message
        end
      end

    end
  end
end
