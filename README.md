# Audio recorder

This is a simple script to record streaming audio and convert it to mp3. I created this to record my favourite radio shows in Brazil that I am unable to listen to because timezones (and then I discovered that my favourites shows are available in SoundCloud).

## Requirements

* timelimit
* livestreamer
* ffmpeg

## Usage

`./audio-recorder.sh url output time`

### Example

`./audio-recorder.sh "hlsvariant://http://mywebsite.com/playlist.m3u8" "/Users/leonardo/Downloads/central98.mp3"`

You can add the script in your crontab, then you will never lose your favourite content again.