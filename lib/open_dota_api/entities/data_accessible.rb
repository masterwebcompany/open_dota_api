module OpenDotaApi
  module Entities
    module DataAccessible
      def method_missing(m, *args, &block)
        data.keys.include?(m.to_s) ? data[m.to_s] : super
      end

      def respond_to?(m, include_private = false)
        data.keys.include?(m.to_s) ? true : super
      end
    end
  end
end
