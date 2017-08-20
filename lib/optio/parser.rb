require 'optparse'
require 'optio/switch'

module Optio
  # A wrapper class for Ruby's {OptionParser}[https://ruby-doc.org/stdlib-2.4.1/libdoc/optparse/rdoc/OptionParser.html]
  # Usage:
  #
  #   p = Optio::Parser.new do |parser|
  #     parser.switch :verbose, short: 'v', desc: 'Verbose logging', type: TrueClass
  #   end
  #   p.parse! # or p.parse!(ARGV) or p.parse!(args_array)
  #
  # By default the arguments that are parsed are the ones in +ARGV+
  #
  # ==== TODO
  # Implement support for sub commands;
  #
  #   Optio::Parser.new do |parser|
  #     parser.subcommand :dance
  #   end
  #
  # TODO expose the option to auto assign short switch
  class Parser
    def initialize(&block)
      @switches = {}
      @subcommands = {}
      @banner = nil
      @parsed_params = {}
      if block_given?
        yield self
      end
    end

    # Define a switch
    #
    # ==== Parameters:
    # switch_name::
    #   The name of the switch, i.e. the string that will represent the switch
    #   :someswitch will be parsed as +--someswitch+
    # opts::
    #   Additional options for the switch;
    #   * +:desc+ - The description that will be shown for the switch.
    #   * +:type+ - Expected argument type, {see OptionParser for details}[https://ruby-doc.org/stdlib-2.4.1/libdoc/optparse/rdoc/OptionParser.html#class-OptionParser-label-Type+Coercion]
    #   * +:short:+ - The short switch, i,e +-h+ for +--help+
    def switch(switch_name, opts = {})
      switch_obj = Switch.new(switch_name, opts)
      store_parameter(switch_name, switch_obj, @switches)
    end

    # TODO support sub commands
    def subcommand(subcommand, opts)
      store_parameter(subcommand, opts, @subcommands)
      raise NotImplementedError, 'support for sub commands is not yet supported'
    end

    # Setup the banner for the option parser
    #
    # ==== Parameters:
    # text::
    #   Banner text
    def banner(text)
      @banner = text
    end

    def parse(args = ARGV)
      parsed_params = {}
      rb_parser(parsed_params).parse(args)
      parsed_params
    end

    def parse!(args = ARGV)
      parsed_params = {}
      rb_parser(parsed_params).parse!(args)
      parsed_params
    end

    private

    def rb_parser(parsed_params)
      OptionParser.new do |rb_parser|
        @switches.each do |switch_name, switch_obj|
          rb_parser.banner = @banner if @banner
          rb_parser.on(*(switch_obj.rb_parser_args)) do |param|
            parsed_params[switch_name] = param
          end
        end
      end
    end

    def store_parameter(parameter, opts, mapping)
      unless parameter.is_a?(Symbol) || parameter.is_a?(String)
        raise ArgumentError, "parameter #{parameter} must be of types Atom or String"
      end
      parameter_sym = parameter.to_sym
      if mapping.has_key?(parameter_sym)
        raise Exceptions::SwitchAlreadyExistsError, "parameter #{parameter} already been defined"
      end
      mapping[parameter_sym] = opts
    end
  end
end
