module ShlispTools

=begin
Macros and constants for use with the shlerb tool.

*Light_\**: simple light values, 1-8 across

*Situation_\**: macros representing stevek's idiom for switching through situations using the tar button, using the lights from left to right
to show which situation is running:
- <tt>\<%= Situation_1 %></tt> emits <tt>(jump (tar 1)) (lights 1)</tt>
- <tt>\<%= Situation_2 %></tt> emits <tt>(jump (tar 1)) (lights 4)</tt>
- etc.

*Bar_\**: scale indexes by bar (Uppercase=major, lowercase=minor), using stevek's arrangement:
- <tt>Bar_A = 0</tt>
- <tt>Bar_B = 1</tt>
- etc.
=end
    
  module Shnth

    Light_1 = 1
    Light_2 = Light_1 * 4
    Light_3 = Light_2 * 4
    Light_4 = Light_3 * 4
    Light_5 = Light_4 * 4
    Light_6 = Light_5 * 4
    Light_7 = Light_6 * 4
    Light_8 = Light_7 * 4

    Situation_1 = "(jump (tar 1)) (lights #{Light_1})"
    Situation_2 = "(jump (tar 1)) (lights #{Light_2})"
    Situation_3 = "(jump (tar 1)) (lights #{Light_3})"
    Situation_4 = "(jump (tar 1)) (lights #{Light_4})"
    Situation_5 = "(jump (tar 1)) (lights #{Light_5})"
    Situation_6 = "(jump (tar 1)) (lights #{Light_6})"
    Situation_7 = "(jump (tar 1)) (lights #{Light_7})"
    Situation_8 = "(jump (tar 1)) (lights #{Light_8})"
    
    Bar_A = 0
    Bar_B = 1
    Bar_C = 2
    Bar_D = 3
    Bar_d = 4
    Bar_c = 5
    Bar_b = 6
    Bar_a = 7

  end

end
