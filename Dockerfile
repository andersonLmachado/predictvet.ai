# 1. Start from a Python 3.12 slim base image
FROM python:3.12-slim

# 2. Set a working directory
WORKDIR /app

# 3. Install Poetry (pin to a specific stable version for consistency)
RUN pip install "poetry==1.7.1"

# 4. Configure Poetry to create virtual environment in project directory
RUN poetry config virtualenvs.create true
RUN poetry config virtualenvs.in-project true

# 5. Copy pyproject.toml and poetry.lock
COPY pyproject.toml poetry.lock* ./

# 6. Run poetry install --no-root --only main
RUN poetry install --no-root --only main

# 7. Copy the predictvet directory
COPY predictvet/ ./predictvet/

# 8. Set environment variables for the ADK agent
ENV ADK_AGENT_NAME=predictvet
ENV PORT=8080

# 9. Expose port 8080
EXPOSE 8080

# 10. Use poetry run directly with the working command
CMD ["poetry", "run", "adk", "run", "predictvet"]