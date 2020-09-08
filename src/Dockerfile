FROM nginx:1.19-alpine
ARG ENVIRONMENT=dev
ARG GITHUB_SHA=1234
RUN mkdir "/usr/share/nginx/html/$ENVIRONMENT"
COPY ./assets  "/usr/share/nginx/html/$ENVIRONMENT"
RUN echo "<p>$ENVIRONMENT - $GITHUB_SHA</p>" >> "/usr/share/nginx/html/$ENVIRONMENT/index.html"