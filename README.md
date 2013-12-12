# ShlispTools

Tools for shlisp/shnth developers. If you don't recognize both of words starting with "sh", this is probably not for you.

Executables:
* shlerb (a templating and uploading tool for txts; an ERB wrapper for shlisp)
* shtool (a collection of little calculations)

Classes/Modules:
* ShlispTools::Ratio    # represents a pitch ratio
* ShlispTools::Scales   # represents a scale (consisting of Ratios)
* ShlispTools::Scales   # tiny collection of predefined scales
* ShlispTools::Shnth    # useful constants and macros for Shnth things

Shlerb code samples in examples directory.

Shlisp & Shnth come from Sbobo - http://shbobo.net

## Installation

Add this line to your application's Gemfile:

    gem 'shlisp_tools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shlisp_tools

## Usage

Shlerb usage:

    shlerb FILENAME

where FILENAME is something like cool_shnth_patches.txt.erb or cool_shnth_patches.shlerb. The contents of the file should be shlisp code with optional ERB sections containing Ruby code. (For more information on ERB, see https://en.wikipedia.org/wiki/ERuby). The Ruby code has access to the modules and classes mentioned above. More details soon.

What shlerb does: it translates the input file into pure shlisp code and then uploads it to the attached Shnth using the "shlisp" command (from http://shbobo.net). If these are error translating the file, the error is displayed and nothing is uploaded.

## Examples

Here's an example of a shlerb file with a single situation. It plays a six-note meta-slendro scale on the keys in the order majora, majorb, majorc, majord, minord, minorc. The tones fade in slowly and will tend to (intentionally) distort as they reach full amplitude. The scale used is part of the collection of pre-defined scales that come with ShlispTools.

    <%
      Slew_mul = 5
      Slew_add = 5
      Modo_mul = 2
    %>
    <% s1 = Scales::MetaSlendro_1.scale(120) %> 
    {
      <%= Shnth::Situation_1 %>

      ; 60Hz-ish
      (srate (short 72 79))

      (arab

        (pan
          (add
            (modo (horna <%= s1[Shnth::Bar_A].n %> <%= s1[Shnth::Bar_A].d %> (slewa (majora) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornc <%= s1[Shnth::Bar_C].n %> <%= s1[Shnth::Bar_C].d %> (slewc (majorc) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (horne <%= s1[Shnth::Bar_d].n %> <%= s1[Shnth::Bar_d].d %> (slewe (minord) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
          )
          144
        )

        (pan
          (add
            (modo (hornb <%= s1[Shnth::Bar_B].n %> <%= s1[Shnth::Bar_B].d %> (slewb (majorb) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornd <%= s1[Shnth::Bar_D].n %> <%= s1[Shnth::Bar_D].d %> (slewd (majord) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornf <%= s1[Shnth::Bar_c].n %> <%= s1[Shnth::Bar_c].d %> (slewf (minorc) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
          )
          80
        )

      )
    }

You can also define your own scales and add a scaling factor to bring them into the right range for your srate.

    <%

      # shortcuts for long names
      S = ShlispTools::Scale
      R = ShlispTools::Ratio

      # define scale with 1/1 = 100 100
      myMetaSlendro = S::Scale.new([
        R::Ratio.new( 1,  1),
        R::Ratio.new(37, 32),
        R::Ratio.new(21, 16),
        R::Ratio.new(49, 32),
        R::Ratio.new( 7,  4),
        R::Ratio.new( 2,  1)
      ]).scale(100)

      # get nume and deno for a given scale degree, using indexes 0 through 5 for a six-note scale
      #   1/1:
      #   myMetaSlendro[0].nume
      #   myMetaSlendro[0].deno
      #
      #   37/32
      #   myMetaSlendro[1].nume
      #   myMetaSlendro[1].deno
      #
      #   ... 

    %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
