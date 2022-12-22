FROM golang:1.19-alpine AS builder

WORKDIR /go/src/app

COPY . /go/src/app

RUN go build fullcyclerocks.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app /app

ENTRYPOINT [ "./fullcyclerocks" ]