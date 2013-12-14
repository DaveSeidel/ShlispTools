module ShlispTools

  # a Shlisp-oriented representation of a pitch in just/rational intonation;
  # all terms 0 <= n <= 256
  class Ratio
    include Enumerable

    attr_reader :nume, :deno, :rat

    def initialize(nume, deno, scale=nil)
      @nume = nume
      @deno = deno
      _set_rat
      scale(scale)
    end

    # pos: scale up (multiply)
    # neg: scale down (divide)
    def scale(mul)
      if mul
        if mul >= 0
          @nume *= mul
          @deno *= mul
          @nume = 255 if @nume > 255
          @deno = 255 if @deno > 255
        else
          mul = mul.abs
          @nume /= mul
          @deno /= mul
          @nume = 1 if @nume <= 0
          @deno = 1 if @deno <= 0
        end
      end
    end

    def n
      @nume
    end

    def n=(nume)
      @nume = nume
      _set_rat
    end

    def d
      @deno
    end

    def d=(deno)
      @deno = deno
      _set_rat
    end

    def reduce
      Ratio.new(@rat.numerator, @rat.denominator)
    end

    def reduce!
      @nume = @rat.numerator
      @deno = @rat.denominator
    end

    def to_s
      "#{@nume}/#{@deno}"
    end

    def to_r
      @rat
    end

    def each
      yield @rat
    end

    def <=>(other)
      @rat <=> other.rat
    end

    private
      def _set_rat
        @rat = Rational(@nume, @deno)
      end
  end

end