module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        # Sends the callback with "by_" prefix, eg: by_name
        results = results.send("by_#{key}", value) if value
      end
      results
    end
  end
end