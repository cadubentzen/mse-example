# MSE demo

Example of using MSE for adaptive streaming.

## Getting started

```bash
./download_media.sh
python3 -m http.server
```

Then, open a browser at http://0.0.0.0:8000

## Walkthrough

The demo plays a movie with 5 different qualities:

| Start | End   | Bitrate (kbps) | Width (px) | Height (px) |
|-------|-------|----------------|------------|-------------|
| 00:00 | 02:23 | 500            | 512        | 214         |
| 02:24 | 04:50 | 800            | 704        | 294         |
| 04:51 | 07:17 | 500            | 512        | 214         |
| 07:18 | 09:44 | 1400           | 1024       | 428         |
| 09:45 | 12:13 | 1700           | 1152       | 482         |

To accomplish that, the movie is split into segments. Using MSE, we perform the following at a high level:

```
index = 1
numberOfChunks = 245
for i in [1 ... 5]:
    Push Initialization Segment for quality $i
    repeat (numberOfChunks / 5) times:
        Push Segment $index of quality $i
        index++
```

However, this is async in JS, so there are callbacks involved in there. One can see this flow by looking at the browser console output.


## TODO

- Video only for now. Add audio.