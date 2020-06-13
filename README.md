# twitch-stream-tsunami

A serial version of [tsunami](https://github.com/modern-fortran/tsunami)
implemented during my [Twitch stream](https://www.twitch.tv/videos/648204318) on June 11, 2020.

This is cleaned-up code with comments and with few bug fixes that I didn't catch during the stream. Enjoy!

## Dependencies

* gfortran
* Python (for plotting)
* [fpm](https://github.com/fortran-lang/fpm)
* ffmpeg (for animating images)

## Get the code

```
git clone https://github.com/modern-fortran/twitch-stream-tsunami
cd twitch-stream-tsunami
```

## Set up Python environment (for plotting)

```
python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install -r requirements.txt
```

## Install fpm

Follow the directions from [here](https://github.com/fortran-lang/fpm).

## Build the code

```
fpm build
```

## Run the code

```
fpm run
```

## Plot and animate

Run this script to build and run the simulator, plot, and finally animate in an mp4 file:

```
./run.sh
```