package com.devid.musly

import android.content.Intent
import android.net.Uri
import android.os.Build
import androidx.core.content.FileProvider
import com.ryanheise.audioservice.AudioServiceFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : AudioServiceFragmentActivity() {
    private val APK_CHANNEL = "com.devid.musly/apk_installer"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Native APK installer channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, APK_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "installApk") {
                val filePath = call.argument<String>("filePath") ?: ""
                try {
                    val file = File(filePath)
                    if (!file.exists()) {
                        result.error("FILE_NOT_FOUND", "APK file not found: $filePath", null)
                        return@setMethodCallHandler
                    }

                    val uri: Uri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                        FileProvider.getUriForFile(
                            this,
                            "${applicationContext.packageName}.fileprovider",
                            file
                        )
                    } else {
                        Uri.fromFile(file)
                    }

                    val intent = Intent(Intent.ACTION_VIEW).apply {
                        setDataAndType(uri, "application/vnd.android.package-archive")
                        addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    }
                    startActivity(intent)
                    result.success(true)
                } catch (e: Exception) {
                    result.error("INSTALL_ERROR", e.message, null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
