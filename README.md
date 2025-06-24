# ECS Infrastructure Setup

## Overview

This Terraform configuration creates a complete ECS infrastructure for hosting your Node.js frontend and backend applications with the following architecture:

## Architecture Components

### 1. **Single ECS Cluster**

- One ECS cluster (`b3-main-cluster`) hosts both frontend and backend services
- Uses AWS Fargate for serverless container management
- Container insights enabled for monitoring

### 2. **Network Architecture**

- **Public Subnets**: Host the Application Load Balancer and frontend service
- **Private Subnets**: Host the backend service and RDS database
- **NAT Gateway**: Allows private subnet resources to access the internet
- **Service Discovery**: Private DNS namespace for internal service communication

### 3. **Services**

#### Frontend Service

- **Location**: Public subnets with public IP
- **Port**: 80 (exposed to internet via ALB)
- **Task Definition**: Uses your frontend ECR repository
- **Environment Variables**:
  - `REACT_APP_BACKEND_URL=http://backend.local:3000`
  - `NODE_ENV=production`

#### Backend Service

- **Location**: Private subnets (no public IP)
- **Port**: 3000 (only accessible from frontend)
- **Task Definition**: Uses your backend ECR repository
- **Environment Variables**:
  - `NODE_ENV=production`
  - `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`
- **Secrets**: Database password from AWS Secrets Manager

### 4. **Security Groups**

- **ALB Security Group**: Allows HTTP (80) from internet
- **Frontend Security Group**: Allows HTTP (80) from ALB only
- **Backend Security Group**: Allows port 3000 from frontend only
- **RDS Security Group**: Allows PostgreSQL (5432) from VPC CIDR

### 5. **Database**

- **RDS PostgreSQL**: Located in private subnets
- **Security**: Password stored in AWS Secrets Manager
- **Access**: Only accessible from backend service

### 6. **Load Balancer**

- **Application Load Balancer**: Routes traffic to frontend service
- **Target Group**: Health checks on port 80
- **Listener**: HTTP on port 80

## Deployment Instructions

### 1. Deploy Infrastructure

```bash
cd /Users/max-vev/Documents/ynov/project-docker-compose/submodules/projet-infra
terraform init
terraform plan
terraform apply
```

### 2. Build and Push Container Images

```bash
# Get ECR login command
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <frontend-ecr-url>

# Build and push frontend
docker build -t <frontend-ecr-url>:latest ./path/to/frontend
docker push <frontend-ecr-url>:latest

# Build and push backend
docker build -t <backend-ecr-url>:latest ./path/to/backend
docker push <backend-ecr-url>:latest
```

### 3. Update ECS Services (if needed)

```bash
aws ecs update-service --cluster b3-main-cluster --service b3-frontend-service --force-new-deployment
aws ecs update-service --cluster b3-main-cluster --service b3-backend-service --force-new-deployment
```

## Key Outputs After Deployment

- `load_balancer_dns_name`: Public URL to access your application
- `frontend_ecr_repository_url`: ECR repository for frontend images
- `backend_ecr_repository_url`: ECR repository for backend images
- `ecs_cluster_name`: ECS cluster name for CI/CD
- `rds_endpoint`: Database endpoint for backend connection

## Security Features

✅ Backend is not publicly accessible  
✅ Database is in private subnets  
✅ Security groups with minimal required access  
✅ Database password in AWS Secrets Manager  
✅ Container logs sent to CloudWatch

## Communication Flow

1. **Internet → ALB → Frontend Service** (Port 80)
2. **Frontend → Backend** (Internal DNS: `backend.local:3000`)
3. **Backend → RDS** (PostgreSQL connection via private network)

## CI/CD Integration

The infrastructure is ready for GitHub Actions deployment. You can update task definitions and force new deployments using the ECS service names and cluster name provided in the outputs.

## Cost Optimization

- Uses Fargate with minimal resource allocation (256 CPU, 512 Memory)
- RDS on db.t4g.micro (free tier eligible)
- Single NAT Gateway for cost efficiency
- CloudWatch logs with 7-day retention
