#!/usr/bin/env sh

# Check if the required input file is provided
if [ "$#" -lt 1 ]; then
		echo "Usage: $0 input_file [output_resolution]"
		exit 1
fi

input_file="$1"
output_resolution="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
		echo "Error: Input file '$input_file' not found."
		exit 1
fi

# Execute ffmpeg command with or without scaling filter based on output resolution
if [ -n "$output_resolution" ]; then
		ffmpeg -y \
				-v quiet -stats \
				-threads 11 \
				-hwaccel vaapi \
				-vaapi_device /dev/dri/renderD128 \
				-i "$input_file" \
				-vf "scale_vaapi=w=${output_resolution%x*}:h=${output_resolution#*x}" \
				-c:a copy \
				-c:v h264_vaapi \
				-qp 30 \
				"${input_file%.*}-scaled.mp4"
else
		ffmpeg -y \
				-v quiet -stats \
				-threads 11 \
				-hwaccel vaapi \
				-vaapi_device /dev/dri/renderD128 \
				-i "$input_file" \
				-c:a copy \
				-c:v h264_vaapi \
				-qp 30 \
				"${input_file%.*}-scaled.mp4"
fi

