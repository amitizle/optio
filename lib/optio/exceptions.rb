module Optio
  module Exceptions
    # Raised when the same switched is registered more
    # than once
    class SwitchAlreadyExistsError < RuntimeError
    end

    # Raised when trying to register more than one
    # switch with the same short switch name
    class ShortSwitchAlreadyExistsError < RuntimeError
    end
  end
end
