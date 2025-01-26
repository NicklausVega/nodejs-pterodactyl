# Use Node.js 16.13.2
FROM node:16.13.2

# Install any required packages (e.g., git, build tools for node-gyp, etc.)
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates curl git build-essential python3 && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user named "container" (Pterodactyl default)
RUN useradd -m -d /home/container container

# Switch to the non-root user
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Copy the Pterodactyl entrypoint script
COPY --chown=container:container entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# The final command that runs when the container starts
CMD ["/entrypoint.sh"]
