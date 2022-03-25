package com.example.flutter_study_github

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DemoActivity : FlutterActivity() {

    val channel_call_flutter = "channel_call_flutter"

    val TAG = "DemoActivity"

    lateinit var channelCallFlutter:MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val messager = flutterEngine.dartExecutor.binaryMessenger

        channelCallFlutter = MethodChannel(messager,channel_call_flutter)
        Log.e(TAG,"-----configureFlutterEngine")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_demo)
        Log.e(TAG,"-----onCreate")

        findViewById<Button>(R.id.btnCallFlutter).setOnClickListener {
            val params = mapOf(
                "msg" to "这是来自 Android 端的参数"
            )
            channelCallFlutter.invokeMethod(channel_call_flutter,params,object :MethodChannel.Result{
                override fun success(result: Any?) {
                    Log.e(TAG,"-调用flutter代码----success:$result")
                }

                override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                    Log.e(TAG,"-调用flutter代码----error:$errorMessage")
                }

                override fun notImplemented() {
                    Log.e(TAG,"-调用flutter代码----notImplemented")
                }
            })
        }
    }
}