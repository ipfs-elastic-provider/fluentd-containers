FROM fluent/fluentd:v1.14.6-1.1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-logtail \
		 fluent-plugin-kubernetes_metadata_filter \
		 fluent-plugin-record-modifier  \
		 fluent-plugin-cloudwatch-logs \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem