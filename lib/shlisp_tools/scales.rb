require 'shlisp_tools/scale'

module ShlispTools

  # Predefined scales.
  module Scales

    # 1-3-5-7 hexany, utonal stellated
    # second degree (49/48) and 2/1 removed to fit eight buttons
    Hexany1357 = Scale.new(%w[ 1/1 25/24 7/6 5/4 35/24 3/2 5/3 7/4 ])

    MetaSlendro_1 = Scale.new(%w[ 1/1 37/32 21/16 49/32 7/4 2/1 ])
    MetaSlendro_2 = Scale.new(%w[ 1/1 9/8 151/128 3/2 25/16 2/1 ])

    # subset of Grady 12-note Centaur
    CentaurPelog = Scale.new(%w[ 1/1 21/20 7/6 3/2 14/9 2/1 ])

    # from the Scala archives
    Tenney_8    = Scale.new(%w[  1/1 17/16 19/16 5/4  11/8   3/2 13/8  7/4  ])
    Harrison_8  = Scale.new(%w[  1/1 16/15  6/5  5/4  45/32  3/2  5/3 16/9  ])
    Bohlen_8    = Scale.new(%w[  1/1 10/9   6/5  9/7   7/5  14/9  5/3  9/5  ])
    Fibo_9      = Scale.new(%w[  1/1 17/16  5/4 21/16 89/64  3/2 13/8 55/32 ])
    Gann_Ghost  = Scale.new(%w[  1/1  9/8   7/6 21/16  4/3   3/2 14/9  7/4  ])

  end

end