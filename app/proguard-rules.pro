# ProGuard rules for IronReign
#
# Keep ML Kit and ARCore classes used by reflection. The following rules help
# prevent code shrinking from removing classes that the libraries dynamically
# access.

-keep class com.google.mlkit.** { *; }
-keep class com.google.ar.** { *; }
