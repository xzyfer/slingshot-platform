module Accessor

  def initialize(params)
    @params=params
  end

  # TODO write methods
  def method_missing(sym, *args)
    @params[sym.to_s]
  end

end
