
module SelectWhere

  class NonBoolReturnForValueProc < StandardError

    def initialize(result)
      super("callables used in matchers must return a bool. #{result.class.to_s} was returned")
    end

  end

end
