#!/usr/bin/env bash
output_dir=$(mktemp -d)
audio="$output_dir/audio.wav"
output="$output_dir/output"

ffmpeg -i "$1" -ar 16000 -ac 1 -c:a pcm_s16le "$audio"
./whisper.cpp/main -l auto -m ./whisper.cpp/models/ggml-large-v3.bin --output-srt --output-file "$output" "$audio"

ffmpeg  -i "$1" -i "$output.srt" -c:v copy -c:a copy output.mkv