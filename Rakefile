desc 'Install yeti.css'
task :install_yeti_css do
  mkdir_p 'tmp'
  Dir.chdir('tmp') do
    `wget -O yeti.css-7.1.0.zip 'https://github.com/andyet/yeti.css/archive/v7.1.0.zip'`
    `unzip yeti.css-7.1.0.zip`
    cp 'yeti.css-7.1.0/public/css/main.css', '../source/stylesheets/releases/yeti.css-7.1.0-main.css'
  end
end
