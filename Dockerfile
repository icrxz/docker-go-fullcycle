FROM golang:1.20 AS build

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o docker main.go

FROM scratch 

WORKDIR /app

COPY --from=build /app/docker ./

CMD ["./docker"]
