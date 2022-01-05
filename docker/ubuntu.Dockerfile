FROM lawrenceching/nghttp2:latest AS build

FROM ubuntu
COPY --from=build \
    /usr/local/share/nghttp2/ \
    /usr/local/share/nghttp2/
COPY --from=build \
    /usr/local/bin/h2load \
    /usr/local/bin/nghttpx \
    /usr/local/bin/nghttp \
    /usr/local/bin/nghttpd \
    /usr/local/bin/
COPY --from=build /usr/local/lib/nghttp2/reuseport_kern.o \
    /usr/local/lib/nghttp2/