# -*- encoding : utf-8 -*-"

module Conjects

  # Define instance-variables for Conjects' classes
  module Arguments

    # Add ClassMethods on include
    def self.included base
      base.extend ClassMethods
    end

    # ClassMethods of Conjects' classes
    module ClassMethods

      # Define an accessor
      # @param [Symbol] name of the argument
      def argument name
        attr_accessor name
      end
    end

  end
end
