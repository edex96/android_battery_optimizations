Using this plugin you can:
    * check if battery optimization is enabled or disabled for your flutter app
    * launch request unrestrict dialog

This plugin does not cover "manufacturer battery optimizations" checks yet. Considering to add this feature in 2025.

#### reference
https://developer.android.com/topic/performance/background-optimization

#### how to use
```
bool? isEnabled;

Widget permissionButton() {
    return TextButton(
        onPressed: () async {
            isEnabled = await AndroidBatteryOptimizations.isEnabled();
            setState(() => isEnabled);
            if (!isEnabled!) {
                await AndroidBatteryOptimizations.showPermissionDialog();
                // waiting a little for the setting to propagate
                await Future.delayed(const Duration(seconds: 1)); 
                if (mounted) {
                    isEnabled = await AndroidBatteryOptimizations.isEnabled();
                    setState(() => isEnabled);
                }
            }
        },
        child: Text('${isEnabled ?? "..."}'),
    );
}
