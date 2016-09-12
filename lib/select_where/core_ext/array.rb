require 'select_where'

if !Array.method_defined?(:detect_where)
  class Array
    define_method :detect_where do |match_hash| ::SelectWhere.detect(self, match_hash) end
  end
end

if !Array.method_defined?(:select_where)
  class Array
    define_method :select_where do |match_hash| ::SelectWhere.select(self, match_hash) end
  end
end

if !Array.method_defined?(:fetch_map)
  class Array
    define_method :fetch_map do |*args, &block| ::SelectWhere.fetch_map(self, *args, &block) end
  end
end
