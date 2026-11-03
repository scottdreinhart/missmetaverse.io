---
slug: system-design-101-video-streaming
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - video
  - streaming
  - reference
---

# Video Streaming System Design

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-video-streaming-system]]

This guide covers video streaming architecture, transcoding, and adaptive bitrate streaming.

## Video Streaming Components

### 1. Video Upload
- Client upload
- Validation
- Metadata extraction

### 2. Transcoding Pipeline
- Format conversion
- Resolution variants
- Bitrate adaptation

### 3. CDN Distribution
- Edge caching
- Geographic distribution
- Cache invalidation

### 4. Player Integration
- Adaptive bitrate
- DRM protection
- Analytics

## Adaptive Bitrate Streaming

### HLS (HTTP Live Streaming)

```
# Master Playlist
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-STREAM-INF:BANDWIDTH=12800000,RESOLUTION=1920x1080
1080p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=8000000,RESOLUTION=1280x720
720p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=4000000,RESOLUTION=854x480
480p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=2000000,RESOLUTION=640x360
360p/index.m3u8
```

### Transcoding Pipeline

```
┌──────────┐     ┌──────────────┐    ┌──────────────┐     ┌──────────┐
│  Upload  │───▶│  Transcoding │───▶│  Packaging   │───▶│  CDN     │
│  Service │    │  Pipeline    │     │  Service     │     │  Distribution │
└──────────┘    └──────────────┘     └──────────────┘     └──────────┘
```

## Implementation Example

### Transcoding Service

```typescript
// video/transcoding.ts
import { spawn } from 'child_process'

export class TranscodingService {
  async transcode(inputPath: string, outputPath: string): Promise<void> {
    return new Promise((resolve, reject) => {
      const ffmpeg = spawn('ffmpeg', [
        '-i', inputPath,
        '-c:v', 'libx264',
        '-c:a', 'aac',
        '-b:v', '2500k',
        '-preset', 'fast',
        outputPath,
      ])

      ffmpeg.on('close', (code) => {
        if (code === 0) {
          resolve()
        } else {
          reject(new Error(`Transcoding failed with code ${code}`))
        }
      })
    })
  }

  async createVariants(inputPath: string): Promise<void> {
    const resolutions = [
      { width: 1920, height: 1080, bitrate: '12000k' },
      { width: 1280, height: 720, bitrate: '8000k' },
      { width: 854, height: 480, bitrate: '4000k' },
      { width: 640, height: 360, bitrate: '2000k' },
    ]

    for (const resolution of resolutions) {
      const outputPath = `${resolution.width}x${resolution.height}/output.mp4`
      await this.transcodeWithBitrate(inputPath, outputPath, resolution.bitrate)
    }
  }

  private async transcodeWithBitrate(
    inputPath: string,
    outputPath: string,
    bitrate: string,
  ): Promise<void> {
    return new Promise((resolve, reject) => {
      const ffmpeg = spawn('ffmpeg', [
        '-i', inputPath,
        '-c:v', 'libx264',
        '-c:a', 'aac',
        '-b:v', bitrate,
        '-preset', 'fast',
        outputPath,
      ])

      ffmpeg.on('close', (code) => {
        if (code === 0) resolve()
        else reject(new Error(`Transcoding failed with code ${code}`))
      })
    })
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[video-streaming]] — Video streaming patterns
- [[cdn-patterns]] — CDN patterns
- [[media-processing]] — Media processing patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-video-streaming-system|video-streaming-guide]]
