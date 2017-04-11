# Builds a docker gui image
FROM scratch2

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME OKULAR

# Default resolution, change if you like
ENV WIDTH=1280
ENV HEIGHT=720

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################
RUN echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main universe restricted' > /etc/apt/sources.list
RUN echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main universe restricted' >> /etc/apt/sources.list

# Install packages needed for app
RUN apt-get update
RUN apt-get install -y okular okular-extra-backends

#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app

# Copy X app start script to right location
COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Place whater volumes and ports you want exposed here: