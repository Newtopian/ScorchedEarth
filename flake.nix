{
  description = "Scorched Earth - Android development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };

      androidComposition = pkgs.androidenv.composeAndroidPackages {
        cmdLineToolsVersion = "13.0";
        toolsVersion = "26.1.1";
        platformToolsVersion = "37.0.1";
        buildToolsVersions = [ "35.0.0" ];
        platformVersions = [ "35" "34" ];
        includeEmulator = false;
        includeSources = false;
        includeSystemImages = false;
        includeNDK = false;
        useGoogleAPIs = false;
        extraLicenses = [
          "android-sdk-preview-license"
          "android-googletv-license"
          "android-sdk-arm-dbt-license"
          "google-gdk-license"
          "intel-android-extra-license"
          "mips-android-sysimage-license"
        ];
      };
      androidSdk = androidComposition.androidsdk;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.jdk21
          androidSdk
          pkgs.gradle
          pkgs.android-studio
        ];

        ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
        ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
        JAVA_HOME = pkgs.jdk21.home;

        GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/35.0.0/aapt2";

        shellHook = ''
          export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
          echo "Scorched Earth Android dev shell"
          echo "  JAVA_HOME=$JAVA_HOME"
          echo "  ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT"
          echo "  Run 'android-studio .' to open this project"
        '';
      };
    };
}
