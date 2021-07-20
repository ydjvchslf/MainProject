//package com.buyedu.util;
//
//import java.io.BufferedReader;
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStreamReader;
//
//import org.bytedeco.javacpp.avcodec;
//import org.springframework.stereotype.Component;
//
//@Component
//public class VideoEncoder {
//	
//	
//	public File encode(String fileName) {
//		return null;
//	}
//	
//	  /**
//     * ffmpeg -i test.h265 G7.mp4
//     *
//           * @Param VideoPath Video Original Path
//           * @Param TargetPath Target Video Types and Paths
//     * @throws IOException
//     */
//    public static void ffmpegConvert2Mp4(String videoPath, String targetPath) throws IOException {
//        String path = System.getProperty("user.dir") + File.separator + "frameExtract" + File.separator + "ffmpeg.exe";
//        ProcessBuilder processBuilder = new ProcessBuilder(path, "-y",
//                "-i", videoPath,
//                targetPath);
//        processBuilder.redirectErrorStream(true);
//        Process process = processBuilder.start();
//        StringBuilder processOutput = new StringBuilder();
//        try (BufferedReader processOutputReader = new BufferedReader(
//                new InputStreamReader(process.getInputStream()));) {
//            String readLine;
//            while ((readLine = processOutputReader.readLine()) != null) {
//                processOutput.append(readLine + System.lineSeparator());
//            }
//            process.waitFor();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        } finally {
//            if (process != null) {
//                process.destroy();
//            }
//        }
//
//        String[] str = processOutput.toString().trim().split("\n");
//        String[] res = new String[3];
//        System.arraycopy(str, str.length - 3, res, 0, 3);
////        log.info("ffmpegConvert2Mp4 res: {}", String.join("\n", Arrays.asList(res)));
//    }
//
//    /**
//           * Convert H265 video files for MP4
//     *
//     * @param file
//     * @return
//     */
//    public static void ffmpegFrameGrabberConvertToMp4(File file, String targetVideoPath) {
//        FFmpegFrameGrabber frameGrabber = new FFmpegFrameGrabber(file);
//        Frame captured_frame = null;
//        FFmpegFrameRecorder recorder = null;
//        try {
//            frameGrabber.start();
//            recorder = new FFmpegFrameRecorder(targetVideoPath, frameGrabber.getImageWidth(), frameGrabber.getImageHeight(), frameGrabber.getAudioChannels());
//            // Original video format
//            recorder.setVideoCodec(avcodec.AV_CODEC_ID_H265); //avcodec.AV_CODEC_ID_H264  //AV_CODEC_ID_MPEG4
//            // Expect video format
//            recorder.setFormat("mp4");// Set different formats here, can be converted to different formats
//            recorder.setFrameRate(frameGrabber.getFrameRate());
//            //recorder.setSampleFormat(frameGrabber.getSampleFormat()); //
//            recorder.setSampleRate(frameGrabber.getSampleRate());
//            recorder.setAudioChannels(frameGrabber.getAudioChannels());
//            recorder.setFrameRate(frameGrabber.getFrameRate());
//            recorder.start();
//            while ((captured_frame = frameGrabber.grabFrame()) != null) {
//                try {
//                    recorder.setTimestamp(frameGrabber.getTimestamp());
//                    recorder.record(captured_frame);
//
//                } catch (Exception e) {
//                }
//            }
//            recorder.stop();
//            recorder.release();
//            frameGrabber.stop();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public static void main(String[] args) throws IOException {
//        String videoPath = "D:\\project\\frame-extract\\doc\\20xxxxx.h265";
//        String targetVideoPath = videoPath.substring(0, videoPath.lastIndexOf(".") + 1).concat("mp4");
//
//        // ffmpeg.exe conversion
//        ffmpegConvert2Mp4(videoPath, targetVideoPath);
//
//        // ffmpegframegramegramegramegrabber conversion
//        File file = new File(videoPath);
//        targetVideoPath = videoPath.substring(0, videoPath.lastIndexOf(".")).concat("_FFmpegFrameGrabber.").concat("mp4");
//        ffmpegFrameGrabberConvertToMp4(file, targetVideoPath);
//    }
//}
