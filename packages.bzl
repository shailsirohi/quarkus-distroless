load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load(
  "@distroless//package_manager:dpkg.bzl",
  "dpkg_src",
  "dpkg_list",
)

def debian_dependencies():


    dpkg_src(
        name = "amd64_debian10",
        arch = "amd64",
        distro = "stretch",
        sha256 = "369d45f6c138af98d8ea8a598564dcabc1f6991ac777fb2d351e846f195cdc13",
        snapshot = "20201123T030316Z",
        url = "https://snapshot.debian.org/archive",
    )

    dpkg_src(
        name = "amd64_debian10_updates",
        arch = "amd64",
        distro = "stretch-updates",
        sha256 = "5182b40388284eb0eb2199906ec6f4b969391460911db3fba8af22dceecf957e",
        snapshot = "20201123T030316Z",
        url = "https://snapshot.debian.org/archive",
    )

    dpkg_src(
        name = "amd64_debian10_security",
        package_prefix = "https://snapshot.debian.org/archive/debian-security/20201123T063456Z/",
        packages_gz_url = "https://snapshot.debian.org/archive/debian-security/20201123T063456Z/dists/stretch/updates/main/binary-amd64/Packages.gz",
        sha256 = "6fd98039007bd2d242a23bd52bb55525b4ad3c9fab41eefa02e1b5a89ab54bd1",
    )

    dpkg_list(
        name = "package_bundle_amd64_debian10",
        packages = [
            "libstdc++6",
            "zlib1g",
        ],
        sources = [
            "@amd64_debian10_security//file:Packages.json",
            "@amd64_debian10_updates//file:Packages.json",
            "@amd64_debian10//file:Packages.json",
        ],
)
