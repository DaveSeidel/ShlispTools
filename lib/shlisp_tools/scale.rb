module ShlispTools

  # a scale is a series of Ratio instances, always maintained in canonical
  # (reduced) form and ascending order, but available scaled for use in a
  # shlisp/shnth context
  class Scale
    include Enumerable

    # the default separator between scale degrees when scale is printed
    DEF_SEP = ' '

    # arg: either nothing, or an array of Ratios
    def initialize(degrees=nil)
      @degrees = []
      if degrees && !degrees.empty?
        degrees.each { |n| @degrees << n }
        _sort
      end
    end

    # add a new scale degree (Ratio)
    def add(degree)
      @degrees << degree
      _sort
    end

    # add a new note (Ratio) using string/array notation; i.e., myScale << Ratio.new(5,4)
    def <<(degree)
      add(degree)
    end

    # remove the scale degree at the specified position (0-based)
    def remove(idx)
      @degrees.delete_at(idx) rescue nil
    end

    # return the scale degree at a specified postion (0-based)
    def [](idx)
      @degrees[idx] rescue nil
    end

    # number of degrees (notes) in the scale
    def length
      @degrees.length
    end

    # true if scale is empty
    def empty?
      @degrees.empty?
    end

    # iterator
    def each(&block)
      @degrees.each(&block)
    end

    # print the scale
    def to_s
      scaled
    end

    # Shnth-specific: apply a multiplicative factor to every ratio to estabish amplitude.
    # For example, myScale.scale(100) transformss 1/1 to 100/100. Other notes are brought into
    # as close a range as possible while keeping all terms in the 1..255 range.
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

    # print out the "scaled" (multiplied) scale
    def scaled(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_s; out }.join(sep)
    end

    # print out the scale in lowest terms
    def reduced(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_r.to_s; out }.join(sep)
    end

    # Shnth: print out all the nume(erator)s, scaled
    def numes(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.n; out }.join(sep)
    end

    # Shnth: print out all the deno(minators), scaled
    def denos(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.d; out }.join(sep)
    end

    private
      def _sort
        @degrees.sort!
      end
  end

end
