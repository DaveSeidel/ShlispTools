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

Example shlerb code

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

where FILENAME is something like cool_shnth_patches.txt.erb. The contents of the file should be shlisp code with optional ERB sections containing Ruby code. (For more information on ERB, see https://en.wikipedia.org/wiki/ERuby). The Ruby code has access to the modules and classes mentioned above. More details soon. Look in the examples directory for examples.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
