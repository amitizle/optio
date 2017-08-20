
module Optio
  class Switch
    # TODO mandatory switch
    def initialize(name, opts)
      @name = name
      @opts = opts
    end

    def rb_parser_args
      args = ["--#{@name} #{@name.upcase}"]
      if @opts[:short]
        args.unshift("-#{@opts[:short]} #{@name.upcase}")
      end
      [:type, :desc].each do |key|
        if @opts[key]
          args << @opts[key]
        end
      end
      args
    end
  end
end
