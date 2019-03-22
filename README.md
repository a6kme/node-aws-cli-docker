## Node with AWS Cli docker image
- Image name `a6kme/node-aws-cli`
- Tags https://cloud.docker.com/repository/docker/a6kme/node-aws-cli/tags
- Example usage in an docker-compose.yml file
```
version: "3"
services:
  a6kme:
    image: a6kme/node-aws-cli:v1
    environment:
      - AWS_ACCESS_KEY_ID
      - AWS_SECRET_ACCESS_KEY
      - AWS_DEFAULT_REGION
      - CLOUDFRONT_DISTRIBUTION_ID
    volumes:
      - ./:/app
    command: >
      sh -c "cd /app
      npm install &&
      npm run build &&
      npm run export &&
      aws s3 sync ./out s3://a6kme-site-artifacts/ &&
      aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths \"/*\""
```