# Audio Processing Tools

Various audio processing tools written in `fish` shell. Wrapper around the `sox` command line tool for audio processing. 

## Change Tempo

Change tempo of a file without changing it's pitch. Uses the maximum quality settings of `sox tempo`.

### Usage

`./change_tempo file_in file_out tempo_in tempo_out`

Tempis are in bpm. By default, will only show the sox command produced, not run it. Use the `--go` flag to really run the command.

### Example

Speed up the original clip from 90bpm to 110bpm.

`./change_tempo original_version.ogg faster_version.ogg 90 110 --run`

## Loop

Loop a clip until it reaches at least a given duration.

### Usage

`./loop file_in file_out minimum_duration`

Duration is in seconds. By default, will only show the sox command produced, not run it. Use the `--go` flag to really run the command.

### Example

Loop four bars up to a duration of at least two minutes to make a practice backing track.

`./change_tempo four_bars.ogg practice_loop.ogg 120 --run`
