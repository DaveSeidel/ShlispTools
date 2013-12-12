module ShlispTools
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

    # scale indexes by bar (A=major, a=minora), using stevek's arrangement
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
