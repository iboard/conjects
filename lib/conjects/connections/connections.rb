# -*- encoding : utf-8 -*-"

module Conjects

  # Connections can be one-to-many or many-to-many
  module Connections

    # extend ClassMethods to classes of :base
    # include InstanceMethods in objects of :base
    # @param [class] base
    def self.included base
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    # Class-methods of classes including Conjects::Conections
    module ClassMethods

      # Define an accessor for an attribute
      # @param [Symbol] name of the attribute
      def connection name
        attr_accessor name
      end
      alias :connections :connection

    end

    # Instance-methods of objects of classes including Conjects::Conections
    module InstanceMethods

      # Assign value to attribute target
      # @param [Symbol] target - the attribute name
      # @param [Object] value - the value to be assigned
      def link target, value
        send("#{target}=", value)
      end

      # Add value to the array :target
      # @param [Symbol] target - the name of the array to be extended
      # @param [Object||Array] values - Single object or array of objects to be added
      def add target, values
        link target, ( send(target)||[] ) << values
      end

    end
  end
end
