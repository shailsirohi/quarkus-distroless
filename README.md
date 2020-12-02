# Distroless base image

This project creates extends the project for creating distroless image for quarkus. The current project on quarkus github is broken due to cyclical dependencies as well as using Debian 9.

Updating all the versions to latest and build for debain 10


This image contains a minimal Linux, glibc-based system.
It contains:

* ca-certificates
* A /etc/passwd entry for a root user
* A /tmp directory
* tzdata
* glibc
* libssl
* openssl
* zlib1g
* libstdc++6

The final image is about 18.7 MB in size

## Using the image

Build the native executable using:

```bash
mvn package -Pnative -Dnative-image.docker-build=true
```

Then, create the following `Dockerfile`:

```dockerfile
FROM shailsirohi/quarkus-distroless:latest
COPY build/*-runner /application
EXPOSE 8080
CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]
```

Build the docker image using (change the namespace/name):

```bash
docker build -t quarkus-demo/demo .
```

You can then run your application using:

```bash
docker run -i --rm -p 8080:8080 quarkus-demo/demo
```

## Build

<b>Pre-requisite for build</b>

1. bazel (i am using bazel 3.7.1)
2. python (I used 2.7 but as per documentation 3.6 should also work)
3. vc++ (i had 2019 but 2015 should also work as per documentation)
4. A Non-windows machine (Tried for 2 days but weird issues keep on coming. finally gave up when it started giving utf-8 encoding error for subpar). If u don't have linux/mac, spinup an EC2 instance with Amazon Linux 2. It works)
5. docker

```bash
bazel build latest
bazel run :latest
```

if bazel build latest give error due to not finding dpkg_parser, then go to package_manager folder in distroless folder where your repo has been downloaded [Path: <Bazel local cache folder>/<bazel project cache folder>/external/distroless/package_manager] and run the following command:

bazel build ... //package_manager:dpkg_parser.par

After this again run bazel build latest.

It builds the `shailsirohi/quarkus-distroless:lates` image.
