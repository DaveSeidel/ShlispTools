require 'shlisp_tools/scale'

module ShlispTools
  module Scales

    # 1-3-5-7 hexany, utonal stellated
    # second degree (49/48) and 2/1 removed to fit eight buttons
    # 1/1 25/24 7/6 5/4 35/24 3/2 5/3 7/4
    Hexany1357 = Scale.new([
      Ratio.new( 1,  1),
      Ratio.new(25, 24),
      Ratio.new( 7,  6),
      Ratio.new( 5,  4),
      Ratio.new(35, 24),
      Ratio.new( 3,  2),
      Ratio.new( 5,  3),
      Ratio.new( 7,  4)
    ])

    # 1/1 37/32 21/16 49/32 7/4 2/1
    MetaSlendro_1 = Scale.new([
      Ratio.new( 1,  1),
      Ratio.new(37, 32),
      Ratio.new(21, 16),
      Ratio.new(49, 32),
      Ratio.new( 7,  4),
      Ratio.new( 2,  1)
    ])

    # 1/1 9/8 151/128 3/2 25/16 2/1
    MetaSlendro_2 = Scale.new([
      Ratio.new(  1,   1),
      Ratio.new(  9,   8),
      Ratio.new(151, 128),
      Ratio.new(  3,   2),
      Ratio.new( 25,  16),
      Ratio.new(  2,   1)
    ])

    # 1/1 21/20 7/6 3/2 14/9 2/1
    CentaurPelog = Scale.new([
      Ratio.new( 1,   1),
      Ratio.new(21,  20),
      Ratio.new( 7,   6),
      Ratio.new( 3,   2),
      Ratio.new(14,   9),
      Ratio.new( 2,   1)
    ])

  end
end