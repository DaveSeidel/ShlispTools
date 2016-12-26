*NOTE: This project is no longer maintained, as I no longer have a Shnth.*

# Shlerb and ShlispTools

[![Gem Version](https://badge.fury.io/rb/shlisp_tools.png)](http://badge.fury.io/rb/shlisp_tools)

Tools for Shlisp/Shnth developers. If you don't recognize both words starting with "Sh", this is probably not for you.

Online documentation:

- http://daveseidel.github.io/ShlispTools

Executables:

- shlerb (a templating and uploading tool for txts; an ERB wrapper for shlisp)
- shtool (a collection of little calculations)

Classes/Modules:

- ShlispTools::Ratio : represents a pitch ratio
- ShlispTools::Scales : represents a scale (consisting of Ratios)
- ShlispTools::Scales : tiny collection of predefined scales
- ShlispTools::Shnth  : useful constants and macros for Shnth things

Shlerb code examples:

- in the examples directory
- online: https://github.com/DaveSeidel/ShlispTools/tree/master/examples

Shlisp & Shnth come from Sbobo - http://shbobo.net

## Installation

Add this line to your application's Gemfile:

    gem 'shlisp_tools'

And then execute:

    $ bundle

Or install it manually:

    $ gem install shlisp_tools

## Shlerb

Shlerb is a command-line program that generates Shlisp code from a template file and uploads it to a Shnth, assuming that you have one attached to your computer, and that you have the "shlisp" program (from http://shbobo.net) on your path. If there are errors translating the file, the error is displayed and nothing is uploaded.

Shlerb template files are just shlisp source files ("txts")  with optional sections of Ruby code that start with "<%" or "<%=" and end with "%>". Sections that start with "<%" are simply evaluated as Ruby code and are used to set variables or constants or do some other processing. Section that begin with "<%=" are also evaulated as Ruby code, but the output is printed and is thus useful for generating shlisp code.

### Usage

<tt>shlerb FILENAME</tt>

where FILENAME is something like +cool_shnth_patches.txt.erb+ or +cool_shnth_patches.shlerb+. The contents of the file should be shlisp code with optional ERB sections containing Ruby code. (For more information on ERB, see https://en.wikipedia.org/wiki/ERuby). The Ruby code has access to the modules and classes mentioned above.

### Examples

Here's an example of a shlerb file with a single situation. It plays a six-note meta-slendro scale on the keys in the order majora, majorb, majorc, majord, minord, minorc. The tones fade in slowly and will tend to (intentionally) distort as they reach full amplitude. The scale used is part of the collection of pre-defined scales that come with ShlispTools.

    <%
      Slew_mul = 5
      Slew_add = 5
      Modo_mul = 2
    %>
    <% s1 = Scales::MetaSlendro_1.mul(120) %>
    {
      <%= Shnth::Situation_1 %>

      ; 60Hz-ish
      (srate (short 72 79))

      (arab

        (pan
          (add
            (modo (horna <%= s1[Shnth::But_A].n %> <%= s1[Shnth::But_A].d %> (slewa (majora) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornc <%= s1[Shnth::But_C].n %> <%= s1[Shnth::But_C].d %> (slewc (majorc) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (horne <%= s1[Shnth::But_d].n %> <%= s1[Shnth::But_d].d %> (slewe (minord) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
          )
          144
        )

        (pan
          (add
            (modo (hornb <%= s1[Shnth::But_B].n %> <%= s1[Shnth::But_B].d %> (slewb (majorb) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornd <%= s1[Shnth::But_D].n %> <%= s1[Shnth::But_D].d %> (slewd (majord) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
            (modo (hornf <%= s1[Shnth::But_c].n %> <%= s1[Shnth::But_c].d %> (slewf (minorc) <%= Slew_mul %> <%= Slew_add %>)) <%= Modo_mul %>)
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
      myMetaSlendro = S::Scale.new(%w[ 1/1 37/32 21/16 49/32 7/4 2/1 ]).mul(100)

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

## Shtool

Shtool is a command-line program that collects together a few useful calculations.

### Usage

<tt>shtool [[OPERATION] args ...]</tt>

Use <tt>shtool help</tt> for a list of the current set of operations and what they do. For help with any operation, use <tt>shtool OPERATION_NAME</tt> to see what arguments ar expected.

## Caveats

* Ratio, Scale, and the Scales collection all assume "arab" mode.

## Version History

### 0.0.1 through 0.0.3

- details lost in the mists of time

### 0.0.4

- shlerb: don't generate extra lines in output
- Scales may now be written out as a list of ratios (e.g. "7/4"), which is hopefully a lot more intuitive as well as more succinct. The ratios must be inside "%w[]" delimiters and separated by spaces or tabs (see example above). All predefined scales are now written in this format.
- Shnth module: fixed Light_* macros to work properly; rename Bar_* to But_* because they are for buttons and not for bars (d'oh!); add "situ" which I am too lazy to document at the moment.
- Examples: various changes.

##  TODO

- write tests
- write more complete documentation
- allow Ratio and Scale classes to work in "dirac" mode as well as "arab" mode

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
