# Audio Processing Tools

Audio processing tools. Wrapper around the `sox` command line tool for audio processing, written in `fish` shell. 

In both functions, you can use the `--b` or `--blank` flag to only see the produced `sox` command, but not run anything.

## Installation with fisher

`fisher install antoine-gallix/audio`

## Change Tempo

Change tempo of a file without changing it's pitch. Uses the maximum quality settings of the `sox tempo` algorithm.

### Usage

`soxdrawer-change-tempo file_in file_out tempo_in tempo_out`

Tempis are in bpm.

### Example

Speed up the original clip from 90bpm to 110bpm.

`soxdrawer-change-tempo original_version.ogg faster_version.ogg 90 110`

## Loop

Loop a clip until it reaches at least a given duration.

### Usage

`soxdrawer-loop file_in file_out minimum_duration`

Duration is in seconds.

### Example

Loop four bars up to a duration of at least two minutes to make a practice backing track.

`soxdrawer-loop four_bars.ogg practice_loop.ogg 120`
