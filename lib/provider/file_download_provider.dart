import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:external_path/external_path.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/file_download_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_download_provider.g.dart';

part 'file_download_provider.freezed.dart';

@pragma('vm:entry-point')
void downloadCallback(String id, int status, int progress) {
  final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
  send?.send([id, status, progress]);
}

@freezed
sealed class FileDownloadState {
  factory FileDownloadState.idle() = DownloadIdle;
  factory FileDownloadState.success() = DownloadSuccess;
  factory FileDownloadState.error() = DownloadError;
}

@Riverpod(keepAlive: true)
class FileDownload extends _$FileDownload {
  String? _externalPath;

  @override
  FileDownloadState build() {
    clearDownloadTask();
    FlutterDownloader.registerCallback(downloadCallback);
    return DownloadIdle();
  }

  Future<void> clearDownloadTask() async {
    final tasks = await FlutterDownloader.loadTasks();
    tasks?.forEach((e) => FlutterDownloader.remove(taskId: e.taskId, shouldDeleteContent:true));
  }

  Future<void> retryDownload() async {
    final tasks = await FlutterDownloader.loadTasks();
    tasks?.forEach((e) => FlutterDownloader.retry(taskId: e.taskId));
  }

  Future<String?> fileDownload({required FileDownloadData fileDownloadData}) async {
    try {
      _externalPath ??= await _getPublicDownloadFolderPath();
      final String? result = await FlutterDownloader.enqueue(
        url: fileDownloadData.downloadUrl,
        savedDir: _externalPath!,
        saveInPublicStorage: true,
        showNotification: fileDownloadData.showNotification,
      );
      logger.i('taskId : $result}');
      // 다운로드 성공 상태를 프로바이더를 listen하고 있는 객체들에게 전달해주고 바로 다시 Idle 상태로 전환해준다.
      if (result != null) {
        state = DownloadSuccess();
        state = DownloadIdle();
      }
      return result;
    } catch (error, stackTrace) {
      state = DownloadError();
      state = DownloadIdle();
      return Future.error(error, stackTrace);
    }
  }

  Future<List<String?>> multiFileDownload({required List<FileDownloadData> fileDownloadDataList}) async {
    try {
      _externalPath ??= await _getPublicDownloadFolderPath();

      final futureList = List.generate(fileDownloadDataList.length, (index) => FlutterDownloader.enqueue(
        url: fileDownloadDataList[index].downloadUrl,
        savedDir: _externalPath!,
        saveInPublicStorage: true,
        showNotification: fileDownloadDataList[index].showNotification,
      ));
      final List<String?> result = await Future.wait(futureList);

      logger.i('taskId : $result}');
      state = DownloadSuccess();
      state = DownloadIdle();
      return result;
    } catch (error, stackTrace) {
      state = DownloadError();
      state = DownloadIdle();
      return Future.error(error, stackTrace);
    }
  }

  Future<String> _getPublicDownloadFolderPath() async {
    String? downloadDirPath;

    if (Platform.isAndroid) {
      downloadDirPath = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      Directory dir = Directory(downloadDirPath);

      if (!dir.existsSync()) {
        downloadDirPath = (await getExternalStorageDirectory())!.path;
      }
    } else if (Platform.isIOS) {
      downloadDirPath = (await getApplicationDocumentsDirectory()).path;
    } else {
      return Future.error('Not Support Platform');
    }

    return downloadDirPath;
  }
}