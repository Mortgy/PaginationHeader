#
# Be sure to run `pod lib lint PaginationHeader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PaginationHeader'
  s.version          = '0.1.0'
  s.summary          = 'PaginationHeader is made for paging multiple view and syncing the page with the it\'s title header.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
With PaginationHeader you could have multiple pages that each of them does separated job and switch between them through page tabs or the pages it self by scrolling.
                       DESC

  s.homepage         = 'https://github.com/mortgy/PaginationHeader'
  # s.screenshots     = 'TBA', 'TBA_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mortgy' => 'm.mortgy@mortgy.com' }
  s.source           = { :git => 'https://github.com/mortgy/PaginationHeader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PaginationHeader/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PaginationHeader' => ['PaginationHeader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
