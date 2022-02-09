#!/usr/bin/env fish

# parsing
argparse 'g/go' -- $argv
set input_file $argv[1]
set output_file $argv[2]
set input_tempo $argv[3]
set output_tempo $argv[4]

set factor (math $output_tempo / $input_tempo)

echo changing tempo from $input_tempo bpm to $output_tempo bpm

set command sox -V3 (string escape $input_file) (string escape $output_file) tempo $factor 120 30 30
echo $command
# process
if test -n "$_flag_go"
    echo \n----------\n
    eval $command
    echo \n----------\n
else
    echo command was not executed. use flag --go to do so. 
end
