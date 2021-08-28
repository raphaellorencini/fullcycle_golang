FROM hello-world:linux

COPY . .

ENTRYPOINT [ "./main" ]