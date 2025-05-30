package com.example.aletha_health

import android.os.Bundle
import android.app.AlertDialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.stringChannel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger!!, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getStringFromAndroid") {
                val androidString = getStringFromAndroid()
                result.success(androidString)
            } else if (call.method == "showAlert") {
                val message = call.argument<String>("message") // Use 'val' and specify type
                showAlert(message)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getStringFromAndroid(): String {
        return "Hi yousuf this is from android"
    }

    private fun showAlert(message: String?) { // Change to 'fun' and specify type
        AlertDialog.Builder(this)
            .setTitle("Alert")
            .setMessage(message ?: "No message") // Handle null case
            .setPositiveButton(android.R.string.ok, null)
            .show()
    }
}
