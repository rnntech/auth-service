#Stage 1
FROM docker.io/library/golang:1.6 as builder
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 go build -o auth-service ./cmd/server

#Stage 2
FROM docker.io/library/ubi9
COPY --from=builder /app/auth-service . 
ENTRYPOINT [ "./auth-service" ]