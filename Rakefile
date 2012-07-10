task :default => [:export_serve, :compile_coffee, :compile_sass]

task :export_serve do
  `serve export src .`
end

task :compile_coffee do
  `coffee -c javascripts/application.coffee`
end

task :compile_sass do
  `sass stylesheets/application.scss stylesheets/application.css`
end