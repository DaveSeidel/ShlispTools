module ShlispTools

  # A Shlisp-oriented representation of a pitch in just/rational intonation.
  # Numerators are "numes" and denoninators are "denos" as is customary for
  # Shlisp. All terms 0 < n < 256 ("arab" mode in Shlisp).
  class Ratio
    include Enumerable

    # numerator
    attr_reader :nume
    # denominator
    attr_reader :deno
    # rational form
    attr_reader :rat

    def self.parse_ratio(txt)
      parsed = {}
      matches = /(\d+)[\/\:](\d+)/.match(txt)
      if matches && matches.captures.length >= 2
        parsed[:nume] = matches[1].to_i
        parsed[:deno] = matches[2].to_i
      end
      parsed
    end

    def self.parse_new(txt)
      r = parse_ratio(txt)
      Ratio.new(r[:nume], r[:deno])
    end

    def initialize(nume, deno, _mul=nil)
      @nume = nume
      @deno = deno
      _set_rat
      mul(_mul)
    end

    # Get the nume(rator).
    def n
      @nume
    end

    # Set the nume(rator).
    def n=(nume)
      @nume = nume
      _set_rat
      n
    end

    # Get the deno(minator).
    def d
      @deno
    end

    # Set the deno(minator).
    def d=(deno)
      @deno = deno
      _set_rat
      d
    end

    # Multiply both nume and deno by same factor for Shnth amplitude scaling.
    def mul(factor)
      if factor
        factor = factor.abs
        @nume = (@nume * factor) % LIMIT
        @deno = (@deno * factor) % LIMIT
      end
      self
    end

     def scale(factor) #:nodoc:
      mul(factor)
    end

   # Return to the canonical (reduced) value.
    def reset!
      @nume = @rat.numerator
      @deno = @rat.denominator
    end

    # String representation
    def to_s
      "#{@nume}/#{@deno}"
    end

    # Rational representation
    def to_r
      @rat
    end

    # Iterator
    def each #:nodoc:
      yield @rat
    end

    # Comparator, for sorting
    def <=>(other) #:nodoc:
      @rat <=> other.rat
    end

    private
      LIMIT = 256 #:nodoc:

      def _set_rat #:nodoc:
        @rat = Rational(@nume, @deno)
      end
  end

end