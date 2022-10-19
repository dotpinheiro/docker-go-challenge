FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -v -o codeeducation main.go


FROM scratch AS runner

WORKDIR /app

COPY --from=builder ./app/codeeducation /usr/local/bin/codeeducation

CMD [ "codeeducation" ]
