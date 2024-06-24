FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD ["/app/main"]