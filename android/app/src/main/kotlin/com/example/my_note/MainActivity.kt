package com.example.clean_pattern

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Handler
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "com.example.clean_pattern"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        )
        channel.setMethodCallHandler { call, result ->
            // This method is invoked on the main thread.
            when (call.method) {
                "getBattery" -> getBatteryLevel(result)
                "testLoop" -> {
                    for (i in 0..20) {
                        channel.invokeMethod("testLoop", i)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        private fun getBatteryLevel(result: MethodChannel.Result) {
            val batteryLevel: Int
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            } else {
                val intent = ContextWrapper(applicationContext).registerReceiver(
                    null, IntentFilter(
                        Intent.ACTION_BATTERY_CHANGED
                    )
                )
                batteryLevel =
                    intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                        BatteryManager.EXTRA_SCALE,
                        -1
                    )
            }
            result.success(batteryLevel)
        }
    }
}
