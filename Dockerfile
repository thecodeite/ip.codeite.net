FROM hayd/alpine-deno:1.0.0

EXPOSE 8000

WORKDIR /app

USER deno

COPY deps.ts .
RUN deno cache deps.ts

COPY . .
RUN deno cache ip.ts

CMD ["run", "--allow-net", "ip.ts"]