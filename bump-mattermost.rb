#!/usr/bin/env ruby

# [For package maintainers]
# Edit the conf/*.src files with the given Mattermost release.
#
# Usage:
#   ./bump-mattermost.rb mattermost-release-version
#
# Example:
#   ./bump-mattermost.rb 5.33.2

require 'digest'
require 'json'
require 'open-uri'

module Mattermost
  # Describe a Mattermost release from its version and variant.
  class ReleaseDescription < Struct.new(:version, :variant)
  end

  # Retrieve a downloadable release's url and checksum from its ReleaseDescription.
  class Release
    attr_reader :version
    attr_reader :variant
    attr_reader :url
    attr_reader :sum

    def initialize(release_desc)
      @version = release_desc.version
      @variant = release_desc.variant

      retrieve_release_data
    end

    private

    def retrieve_release_data
      case @variant
      when :team_amd64, :team_arm64, :enterprise_amd64, :enterprise_arm64
        retrieve_first_party_release_data
      when :team_armhf
        retrieve_smart_honeybee_release_data
      else
        raise "Unsupported variant '{#release_desc.variant}'"
      end
    end

    def retrieve_first_party_release_data
      edition = {
        team_amd64: 'team',
        team_arm64: 'team',
        enterprise_amd64: 'enterprise',
        enterprise_arm64: 'enterprise'
      }.fetch(variant)

      arch = {
        team_amd64: 'amd64',
        team_arm64: 'arm64',
        enterprise_amd64: 'amd64',
        enterprise_arm64: 'arm64'
      }.fetch(variant)

      @url = "https://releases.mattermost.com/#{version}/mattermost-#{edition}-#{version}-linux-#{arch}.tar.gz"

      puts "Downloading release #{version}-#{edition}-#{arch} for computing checksum…"
      release_file = URI.parse(@url).read
      @sum = Digest::SHA256.hexdigest(release_file)
    end

    def retrieve_smart_honeybee_release_data
      arch = {
        team_armhf: 'arm',
      }.fetch(variant)

      @url = "https://github.com/SmartHoneybee/ubiquitous-memory/releases/download/v#{version}/mattermost-v#{version}-linux-#{arch}.tar.gz"

      puts "Downloading release #{version}-#{variant} for computing checksum…"
      release_file = URI.parse(@url).read
      @sum = Digest::SHA256.hexdigest(release_file)
    end
  end
end

module Yunohost
  class AppSrcFile
    def initialize(path)
      @path = path
    end

    def update_with_release(release)
      src = File.read(@path)
      replace_src_setting!(src, 'SOURCE_URL', release.url)
      replace_src_setting!(src, 'SOURCE_SUM', release.sum)
      File.write(@path, src)
    end

    private

    def replace_src_setting!(str, setting, value)
      str.gsub!(/^#{setting}=.*$/, "#{setting}=#{value}")
    end
  end

  class ReadmeFile
    def initialize(path)
      @path = path
    end

    def update_with_version(version)
      readme = File.read(@path)
      readme.gsub!(/[0-9\.]+~ynh[0-9]+/, "#{version}~ynh1")
      File.write(@path, readme)
    end
  end

  class ManifestFile
    def initialize(path)
      @path = path
    end

    def update_with_version(version)
      manifest_file = File.read(@path)
      manifest = JSON.parse(manifest_file)

      manifest['version'] = "#{version}~ynh1"

      manifest_file = JSON.pretty_generate(manifest, indent: '    ') + "\n"
      File.write(@path, manifest_file)
    end
  end
end

version=ARGV[0]
if version.nil?
  abort("ERROR: The Mattermost release version must be provided.\nExample: ./bump-mattermost.sh 5.33.1")
end

VARIANTS = %i[team_amd64 enterprise_amd64 enterprise_arm64 team_arm64]

# Compute releases URLs and sums
releases = VARIANTS
  .map { |variant| Mattermost::ReleaseDescription.new(version, variant) }
  .map { |description| Mattermost::Release.new(description) }

# Update conf/*.src files
releases.each do |r|
  Yunohost::AppSrcFile.new("conf/#{r.variant}.src").update_with_release(r)
end

# Update manifest file
Yunohost::ManifestFile.new('manifest.json').update_with_version(version)

# Update documentation files
Yunohost::ReadmeFile.new('README.md').update_with_version(version)
Yunohost::ReadmeFile.new('README_fr.md').update_with_version(version)
