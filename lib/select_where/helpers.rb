
module SelectWhere
  module Helpers

    def self.item_matches_target?(item, input_target, value)
      target = input_target.to_sym

      return false if !item.is_a?(Object)
      return false if item.is_a?(Proc)

      if item.class.method_defined?(target)
        if item.class.instance_method(target).parameters.length == 0
          return true if value_matches_target?(item.send(target), value)
        end
      end

      if item.class.method_defined?(:[])
        return true if value_matches_target?(item[target], value)
        return true if value_matches_target?(item[target.to_s], value)
      end

      return false
    end

    def self.value_matches_target?(target, value)
      if value.respond_to?(:call)
        value.call(target)
      else
        target == value
      end
    end

  end
end
