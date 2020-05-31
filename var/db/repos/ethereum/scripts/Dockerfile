FROM gentoo/stage3-amd64

ADD package.accept_keywords /etc/portage/
RUN echo 'USE="-gtk"' >>/etc/portage/make.conf

RUN mkdir -p /etc/portage/repos.conf/
ADD ethereum.conf /etc/portage/repos.conf/

ADD container_test.sh /root/
RUN chmod a+x /root/container_test.sh

WORKDIR /root
