Pod::Spec.new do |s|
# 名称 使用的时候pod search [name]
s.name = "DOPDropDownMenu-Enhanced"
# 代码库的版本
s.version = "1.0.0"
# 简介
s.summary = "DOPDropDownMenu double tableView, The optimization version ，new add image,detailText."
# 主页
s.homepage = "https://github.com/12207480/DOPDropDownMenu-Enhanced"
# 许可证书类型，要和仓库的LICENSE 的类型一致
s.license = { :type => 'MIT', :file => 'LICENSE' }
# 作者名称 和 邮箱
s.author = { "tany" => "122074809@qq.com" }
# 作者主页 s.social_media_url =""
# 代码库最低支持的版本
s.platform = :ios, "6.0"
# 代码的Clone 地址 和 tag 版本
s.source = { :git => "https://github.com/12207480/DOPDropDownMenu-Enhanced.git", :tag => s.version.to_s }
# 如果使用pod 需要导入哪些资源
s.source_files = "DOPdemo/DOPDropDownMenu - Enhanced/**/*.{h,m}"
s.resources = "DOPdemo/DOPDropDownMenu-Enhanced.xcassets"
# 框架是否使用的ARC
s.requires_arc = true
end