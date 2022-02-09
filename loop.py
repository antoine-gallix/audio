#!/usr/bin/env python3
from pydub import AudioSegment
from pathlib import Path
import click


@click.command()
@click.argument("input_file", type=click.Path(exists=True))
@click.argument("output_file", type=click.Path())
@click.option(
    "-n", "repetitions", type=click.INT, help="number of repetitions"
)
def loop(input_file,output_file, repetitions):
    print(f"reading from: {input_file}")
    clip = AudioSegment.from_file(input_file)
    print(f"repeat audio segment {repetitions} times")
    clip = clip * repetitions
    print(f"export to: {output_file}")
    clip.export(output_file)
    print('done')
    
if __name__ == "__main__":
    loop()
