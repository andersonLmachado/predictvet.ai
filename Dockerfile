# 1. Start from a Python 3.12 slim base image
FROM python:3.12-slim

# 2. Set a working directory
WORKDIR /app

# 3. Install poetry
RUN pip install "poetry==1.7.1"


# 4. Copy pyproject.toml and poetry.lock (if it exists)
#    If poetry.lock doesn't exist, only pyproject.toml will be copied.
#    This order is important to leverage Docker layer caching.
COPY pyproject.toml poetry.lock* ./

# 5. Run poetry install --no-root --no-dev
#    This ensures only production dependencies are installed.
RUN poetry install --no-root --only main


# 6. Copy the predictvet directory
COPY predictvet/ ./predictvet/

# 7. Set environment variables for the ADK agent
ENV ADK_AGENT_NAME=predictvet
ENV PORT=8080

# 8. Expose port 8080
EXPOSE 8080

# 9. Define the command to run the agent using ADK
CMD ["python", "-m", "google.adk.cli", "api_server"]
