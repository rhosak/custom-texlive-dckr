FROM alpine:latest
RUN apk update

# installer dependencies
RUN apk add wget perl-lwp-useragent-determined  

WORKDIR /root
ADD https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz .
RUN tar xf /root/install-tl-unx.tar.gz 
COPY texlive.profile .
# RUN perl install-tl-*/install-tl  --scheme full --no-interaction
RUN perl install-tl-*/install-tl --profile texlive.profile
