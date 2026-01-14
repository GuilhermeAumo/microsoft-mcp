# Use Python 3.12 as base image
FROM python:3.12-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Set working directory
WORKDIR /app

# Copy dependency files and README (needed for build)
COPY pyproject.toml uv.lock README.md ./

# Copy source code (needed for build)
COPY src/ ./src/
COPY authenticate.py ./

# Install dependencies
RUN uv sync --frozen --no-dev

# Set the entry point
ENTRYPOINT ["uv", "run", "microsoft-mcp"]

# Default command (can be overridden)
CMD []

