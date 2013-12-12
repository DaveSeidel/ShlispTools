module ShlispTools
  class Scale
    include Enumerable

    DEF_SEP = ' '

    def initialize(degrees=nil)
      @degrees = []
      if degrees && !degrees.empty?
        degrees.each { |n| @degrees << n }
        _sort
      end
    end

    def add(degree)
      @degrees << degree
      _sort
    end

    def remove(idx)
      @degrees.delete_at(idx) rescue nil
    end

    def scale(mul)
      unless empty?
        @degrees.each_with_index do |note,i|
          if i == 0
            note.scale(mul)
          else
            tmp = ((mul > note.deno) ? mul : mul*2)
            note.scale((tmp / note.deno).to_i)
          end
        end
      end
      self
    end

    def [](idx)
      @degrees[idx] rescue nil
    end

    def length
      @degrees.length
    end

    def empty?
      @degrees.empty?
    end

    def <<(degree)
      add(degree)
    end

    def each(&block)
      @degrees.each(&block)
    end

    def to_s
      scaled
    end

    def scaled(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_s; out }.join(sep)
    end

    def reduced(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_r.to_s; out }.join(sep)
    end

    def numes(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.n; out }.join(sep)
    end

    def denos(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.d; out }.join(sep)
    end

    private
      def _sort
        @degrees.sort!
      end
  end
end
