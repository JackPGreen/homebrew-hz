class HazelcastManagementCenterAT581Snapshot < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "5.8.1-SNAPSHOT"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-latest-snapshot.tar.gz"
    sha256 "bcd1330a10c3336732c4693735bba7e1728754b7ad9356e1d631d0cd27a35e0e"
    conflicts_with "hazelcast-management-center@6.0.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@6.0.0.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.8.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.7.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.7.1.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.7.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.7.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.6.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.6.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.6.1.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.6.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.3.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.1.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.5.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.4.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.3", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.1.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.3.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.2.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.1.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center@5.0.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.8", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.7", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.6", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.5", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.4", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.3", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.2", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.1", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-5.0", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center-snapshot", because: "you can install only a single hazelcast-management-center package"
    conflicts_with "hazelcast-management-center", because: "you can install only a single hazelcast-management-center package"

    depends_on "openjdk@21" => :recommended

    def install
      libexec.install Dir["*"]
      Dir["#{libexec}/bin/*mc*"].each do |path|
        executable_name = File.basename(path)
        if executable_name.end_with? ".bat"
          next
        end
        (bin/executable_name).write_env_script libexec/"bin/#{executable_name}", Language::Java.overridable_java_home_env
      end
      prefix.install_metafiles
    end

    def post_install
      exec "echo Hazelcast Management Center has been installed."
    end

  end
