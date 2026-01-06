# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Docker image using Vector for automatic container log collection. Collects logs from all Docker containers via Docker socket, writes compressed logs per container organized by date.

## Build and Run

```bash
# Build and run with docker-compose
docker compose up -d --build

# Rebuild after changes
docker compose build

# View logs
docker compose logs -f vector
```

## Architecture

- **Base image**: `timberio/vector:0.43.1-alpine`
- **Vector config** (`vector.yaml`): Collects Docker container logs and writes to `/logs/{container_name}/{date}.log.zst` with zstd compression
- **Log output**: Compressed text format, organized by container name and date

## Key Files

- `Dockerfile` - Alpine-based Vector image with zstd support
- `vector.yaml` - Vector pipeline configuration (docker_logs source → file sink)
- `docker-compose.yml` - Service definition with Docker socket mount and log volume at `../docker-logs`

## Git Commit Command ('gc')

When a developer uses the 'gc' command, follow these steps:

1. Understand that 'gc' means git commit for already staged files only - the developer has already staged the files
2. Check staged files using `git diff --name-only --staged` to see which files will be committed
3. Analyze the changes:
   - Use `git diff --staged` to see the actual changes
   - Read key modified files to understand the context
   - Check surrounding code if needed to understand why changes were made
4. Create an appropriate commit message following the commit convention below
5. Execute git commit with the message

## Commit Convention

Use conventional commits with the following format:
- Format: `type: description`
- Use lowercase for commit messages
- Do not include file extensions

### Commit Types

- `feat`: New feature or functionality
- `fix`: Bug fix
- `docs`: Documentation changes
- `chore`: Build configuration, dependencies, tooling
- `refactor`: Code restructuring without behavior change
- `style`: Formatting changes

### Commit Body Guidelines

For non-trivial changes, the commit body should explain:

- Why: The motivation and context (what problem does this solve?)
- How: The implementation approach and key decisions

Do NOT list file-by-file changes - git diff shows that. Simple changes like formatting or typo fixes don't need body text.

### Examples

Simple changes (no body needed):
- `docs: update README with usage instructions`
- `chore: upgrade vector base image version`
- `fix: correct vector config syntax`

Complex changes (concise body explaining why and how):
```
feat: add weekly rotation option

Enable configurable rotation frequency for environments with
lower log volume where daily rotation is excessive.
```
