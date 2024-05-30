# frozen_string_literal: true

require "caveats"
require "cli/parser"
require "formula"

module Homebrew
  extend T::Sig

  module_function

  sig { returns(CLI::Parser) }
  def caveats_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        Display installation caveats of a <formula> or <cask>.
      EOS

      switch "--formula", "--formulae",
             description: "Treat all named arguments as formulae."
      switch "--cask", "--casks",
             description: "Treat all named arguments as casks."
      
      conflicts "formula", "cask"

      named_args [:formula, :cask], min: 1
    end
  end

  sig { void }
  def caveats
    args = caveats_args.parse
    print_caveats(args: args)
  end

  sig { params(args: CLI::Args).void }
  def print_caveats(args:)
    args.named.to_formulae_and_casks_and_unavailable.each_with_index do |obj, i|
      puts unless i.zero?

      case obj
      when Formula
        puts_formula_caveats obj
      when Cask::Cask
        puts_cask_caveats obj
      when FormulaOrCaskUnavailableError
        ofail obj.message
        # No formula with this name, try a missing formula lookup
        if (reason = MissingFormula.reason(obj.name, show_info: false))
          $stderr.puts reason
        end
      else
        raise
      end
    end
  end

  def puts_formula_caveats f
    oh1 f.full_name
    unless (c = Caveats.new(f)).empty?
      puts c.to_s
    else
      puts "No caveats exist for #{f.full_name}."
    end
  end
  
  def puts_cask_caveats cask
    oh1 cask
    unless cask.caveats.empty?
      puts cask.caveats
    else
      puts "No caveats exist for #{cask}."
    end
  end
end
