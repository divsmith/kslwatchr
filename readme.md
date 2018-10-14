# KSL Watchr

## Installing and Running:
- Clone repo or download zip

## Frontend React/Backend GraphQL
- [Install Docker](https://docs.docker.com/install/)
  - May need to [Install Docker Compose](https://docs.docker.com/compose/install/)
- In Terminal/PowerShell, CD to repo directory
- run `docker-compose up` to create the new image based on node and our app
- *May need to install images*
    - `docker pull node:8.12.0`
    - `docker pull postgres:10`
- Browse to: [localhost:3000](http://localhost:3000)
- You can use `ctrl + c` to interrupt and stop the server then use `docker-compose down` to unbuild it cleanly

### Backend Python Web Scraper
- [Install pipenv](https://pipenv.readthedocs.io/en/latest/)
- In Terminal/PowerShell, CD to ./ksl-scraper
- Install the dependencies `pipenv install`
- If not installed, download and install Chrome or Chromium
- Run by `pipenv run python scraper.py`