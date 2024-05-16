# Operating System used on the container
FROM debian:bullseye

# Let's Expose the port for nginx to run on
EXPOSE 9000

# Check for updates and install the necessary files
# to install nginx and openssl successfully
RUN apt update && apt upgrade -y
RUN apt 