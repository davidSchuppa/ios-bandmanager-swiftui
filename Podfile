# Uncomment the next line to define a global platform for your project
 platform :ios, '12.1'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

target 'BandManager' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
#  inhibit_all_warnings!

  # Pods for BandManager
  pod 'Firebase/Database'
  pod 'GoogleSignIn'

  target 'BandManagerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BandManagerUITests' do
    # Pods for testing
  end

end
