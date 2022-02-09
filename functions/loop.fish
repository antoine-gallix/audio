#!/usr/bin/env fish

# parsing
argparse 'g/go' -- $argv
set input_file $argv[1]
set output_file $argv[2]
set minimum_loop_duration $argv[3]


set file_duration (soxi -D $input_file)
echo input audio duration: $file_duration s
set repetition (math "ceil($minimum_loop_duration / $file_duration)")


echo looping audio $repetition times. final duration (math "$repetition * $file_duration") s

set command sox -V3 (string escape $input_file) (string escape $output_file) repeat $repetition
echo $command
# process
if test -n "$_flag_go"
    echo \n----------\n
    eval $command
    echo \n----------\n
else
    echo command was not executed. use flag --go to do so. 
end
