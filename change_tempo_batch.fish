#!/usr/bin/env fish

# parsing
argparse 'i/in=' 'o/out=' 'b/base-tempo=' 't/target-tempo=' 'g/go' -- $argv
set INPUT_DIR (string trim --right -c '/' $_flag_in)
set OUTPUT_DIR (string trim --right -c '/' $_flag_out)
set FACTOR (math $_flag_target_tempo / $_flag_base_tempo)


# echo
echo changing tempo from $_flag_base_tempo to $_flag_target_tempo
echo input dir: $INPUT_DIR
echo output dir: $OUTPUT_DIR
if test -z "$_flag_go"
    echo this is a test run. to execute the commands, use flag --go
end
echo

# process
for infile in $INPUT_DIR/*
    set outfile $OUTPUT_DIR/(basename $infile)
    set command sox -V3 (string escape $infile) (string escape $outfile) tempo $FACTOR 120 30 30
    echo $command
    if test -n "$_flag_go"
        eval $command
    end

end