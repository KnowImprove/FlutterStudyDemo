package com.example.flutter_study_github

import android.content.Context
import android.content.Intent
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.channels.ChannelResult.Companion.success
import java.lang.Exception

class MainActivity: FlutterActivity() {

    val channel_name = "flutter_native_channel"

    val TAG = "channel_msg"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val messager = flutterEngine.dartExecutor.binaryMessenger

        val channel = MethodChannel(messager,channel_name)

        channel.setMethodCallHandler { call, result ->
            when(call.method){
                channel_name -> {
                    // 获取传入的参数
                    val msg = call.argument<String>("type")
                    Log.e(TAG, "正在执行原生方法，传入的参数是：「$msg」")
                    var responseStr = ""
                    when(msg){
                        "toast"->{
                            val content = call.argument<String>("content")
                            Toast.makeText(this@MainActivity,content,Toast.LENGTH_LONG).show()
                            responseStr = "toast执行成功"
                        }
                        "versionCode"->{
                            // 通知执行成功
                            responseStr = "获取版本号：${getVersionCode(this@MainActivity)}"
                        }
                        "jump"->{
                            startActivity(Intent(this@MainActivity,DemoActivity::class.java))
                            // 通知执行成功
                            responseStr = "跳转原生demoActivity"
                        }
                    }
                    Log.e(TAG, "执行结果：「$responseStr」")

                    // 通知执行成功
                    result.success("执行结果:$responseStr")
                }
                else -> {
                    result.error("110","执行结果：failed",null)
                }
            }
        }
    }

    @Synchronized
    fun getVersionCode(context: Context): Int {
        try {
            val packageManager: PackageManager = context.packageManager
            val packageInfo: PackageInfo = packageManager.getPackageInfo(
                context.packageName, 0
            )
            return packageInfo.versionCode
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return 0
    }
}
