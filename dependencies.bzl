
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def distroless_bazel_repositories():

    git_repository(
        name = "distroless",
        commit = "03b1c748f6c7aa5d81b92838374309ac997e8100",
        remote = "https://github.com/GoogleContainerTools/distroless.git",
    )
