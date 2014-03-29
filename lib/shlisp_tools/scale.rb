module ShlispTools

  # A scale is a series of Ratio instances, always maintained in canonical
  # (reduced) form and ascending order, but available with amplitude scaling
  # for use in a Shlisp/Shnth context.
  class Scale
    include Enumerable

    # The default separator (' ') between scale degrees when scale is printed.
    DEF_SEP = ' '

    # Arg: either nothing, or an array of Ratios
    def initialize(degrees=nil)
      @degrees = []
      if degrees && !degrees.empty?
        degrees.each do |n|
          n = Ratio::parse_new(n) if n.is_a?(String)
          raise "Bad scale degree: #{n.inspect}" unless n.is_a?(Ratio)
          @degrees << n
        end
        _sort
      end
    end

    # Add a new scale degree (Ratio).
    def add(degree)
      @degrees << degree
      _sort
      self
    end

    # Add a new scal degree (Ratio) using string/array notation; i.e., myScale << Ratio.new(5,4)/
    def <<(degree)
      add(degree)
      self
    end

    # Remove the scale degree at the specified position (0-based).
    def remove(idx)
      @degrees.delete_at(idx) rescue nil
      self
    end

    # Return the scale degree at a specified postion (0-based).
    def [](idx)
      @degrees[idx] rescue nil
    end

    # Return the number of degrees (notes) in the scale.
    def length
      @degrees.length
    end

    # Return true if scale is empty, false otherwise.
    def empty?
      @degrees.empty?
    end

    # Apply a multiplicative factor to every ratio for Shnth amplitude scaling.
    # For example, myScale.scale(100) transforms 1/1 to 100/100. Other notes are brought into
    # as close a range as possible while keeping all terms in the 1..255 range.
    def mul(factor)
      unless empty?
        @degrees.each_with_index do |note,i|
          if i == 0
            note.mul(factor)
          else
            tmp = ((factor > note.deno) ? factor : factor*2)
            note.mul((tmp / note.deno).to_i)
          end
        end
      end
      self
    end

    def scale(factor) #:nodoc:
      mul(factor)
    end

    # Print the scale (multipied).
    def to_s
      multiplied
    end

    # Print out the scale (multiplied).
    def multiplied(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_s; out }.join(sep)
    end

    def scaled(sep=DEF_SEP) #:nodoc:
      multiplied(sep)
    end

    # Print out the scale in canonical form (reduced rations).
    def canonical(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.to_r.to_s; out }.join(sep)
    end

    def reduced(sep=DEF_SEP) #:nodoc:
      canonical(sep)
    end

    # Print out all the nume(rator)s, multiplied.
    def numes(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.n; out }.join(sep)
    end

    # Print out all the deno(minators), multiplied.
    def denos(sep=DEF_SEP)
      @degrees.inject([]) { |out,d| out << d.d; out }.join(sep)
    end

    # iterator
    def each(&block) #:nodoc
      @degrees.each(&block)
    end

    private
      def _sort
        @degrees.sort!
      end
  end

end
