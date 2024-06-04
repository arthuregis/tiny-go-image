FROM golang as base

WORKDIR /src/fullcycle/app/

COPY ./app .

RUN go mod download
RUN go mod verify
RUN go build -o /main .

FROM scratch

COPY --from=base /main .

CMD ["./main"]
