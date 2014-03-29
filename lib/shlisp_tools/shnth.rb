module ShlispTools

=begin
Macros and constants for use with the shlerb tool.

*Light_\**: simple light values, 1-8 across

*Situation_\**: macros representing stevek's idiom for switching through situations using the tar button, using the lights from left to right
to show which situation is running:
- <tt>\<%= Situation_1 %></tt> emits <tt>(jump (tar 1)) (lights 1)</tt>
- <tt>\<%= Situation_2 %></tt> emits <tt>(jump (tar 1)) (lights 4)</tt>
- etc.

*But_\**: scale indexes by bar (Uppercase=major, lowercase=minor), using stevek's arrangement:
- <tt>But_A = 0</tt>
- <tt>But_B = 1</tt>
- etc.
=end

  module Shnth

    Light_1 = 1
    Light_2 = Light_1 * 2
    Light_3 = Light_2 * 2
    Light_4 = Light_3 * 2
    Light_5 = Light_4 * 2
    Light_6 = Light_5 * 2
    Light_7 = Light_6 * 2
    Light_8 = Light_7 * 2

    Situation_1 = "(jump (tar 1)) (lights #{Light_1})"
    Situation_2 = "(jump (tar 1)) (lights #{Light_2})"
    Situation_3 = "(jump (tar 1)) (lights #{Light_3})"
    Situation_4 = "(jump (tar 1)) (lights #{Light_4})"
    Situation_5 = "(jump (tar 1)) (lights #{Light_5})"
    Situation_6 = "(jump (tar 1)) (lights #{Light_6})"
    Situation_7 = "(jump (tar 1)) (lights #{Light_7})"
    Situation_8 = "(jump (tar 1)) (lights #{Light_8})"

    But_A = 0
    But_B = 1
    But_C = 2
    But_D = 3
    But_d = 4
    But_c = 5
    But_b = 6
    But_a = 7

    def self.light(position)
        2**(position-1)
    end

    def self.situ(position, method=:tar)
        case method
        when :tar
            jump = "(jump (tar 1))"
        when :minor_ab
            jump = "(jump (minorb 1 (minora -1)))"
        else
            ;
        end

        "#{jump} (lights #{light(position)})"
    end

    def self.join(*stuff)
        stuff.join(' ').squeeze(' ')
    end

  end

end
