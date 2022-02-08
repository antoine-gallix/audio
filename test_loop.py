from loop import read_segment
from pathlib import Path
import pytest


def wav_file(tmp_path):
    audio_file = Path(tmp_path) / "clip.wav"
    audio_file.touch()
    return str(audio_file)


def test__loop(mocker, wav_file):
    AudioSegment_mock = mocker.patch("loop.AudioSegment")
    loop_(source=wav_file)
    AudioSegment_mock.from_wav.assert_called_once_with(str(audio_file))


