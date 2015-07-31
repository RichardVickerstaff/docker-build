namespace :"docker-build" do

  def image_name file
    file.sub('Dockerfile.','')
  end

  def tag
    tag = `git reflog --decorate -1`.match(/tag: (?<tag>.*?),/)
    tag.nil? ? "latest" : tag[:tag]
  end

  def docker_repo
    "#{@docker_repo}/"
  end

  def run_before_hooks file
    File.open(file, 'r') {|f| @file = f.read }

    hooks = @file.scan(/^##=\s?(.*)/)
    hooks.each do |hook|
      sh hook.first
    end
  end

  files = Dir["Docker*"]
  task :build => files.map { |file| "docker:build:#{image_name file}"}
  task :push => files.map { |file| "docker:push:#{image_name file}"}

  namespace :build do
    files.each do |file|
      desc "Build #{file}"
      task image_name(file).to_sym do
        run_before_hooks file
        sh "ln -snf #{file} Dockerfile"
        sh "docker build -t '#{docker_repo}#{image_name file}:#{tag}' ."
        sh "rm -f Dockerfile"
      end
    end
  end

  namespace :push do
    files.each do |file|
      desc "Push #{file}"
        task image_name(file).to_sym do
        sh "docker push '#{docker_repo}#{image_name file}:#{tag}'"
      end
    end
  end
end
