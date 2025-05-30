# Route53 Domain Configuration for holomatch.org

## Summary of Changes

This configuration sets up your newly purchased domain "holomatch.org" to work with your infrastructure.

### What was configured:

1. **Route53 Hosted Zone**: Created for holomatch.org domain
2. **DNS Records**: 
   - A record for holomatch.org pointing to your ALB
   - A record for www.holomatch.org pointing to your ALB
3. **SSL Certificate**: AWS Certificate Manager certificate for HTTPS
4. **Basic HTTP Configuration**: ALB configured for HTTP access initially
5. **Cognito Integration**: Updated to support custom domain
6. **Application URLs**: Updated to use https://holomatch.org

### Deployment Steps (Two-Stage Process):

#### Stage 1: Initial Deployment

1. **Deploy Infrastructure**: Run the following commands:
   ```bash
   cd /Users/max-vev/Documents/ynov/project-docker-compose/submodules/projet-infra
   terraform init
   terraform plan
   terraform apply
   ```

2. **Update Domain Name Servers**: After the apply, get the name servers from the output:
   ```bash
   terraform output hosted_zone_name_servers
   ```
   Configure these name servers in your domain registrar (where you bought holomatch.org).

3. **Wait for DNS Propagation**: Wait 24-48 hours for DNS to propagate globally.

4. **Verify Domain**: Test that your domain resolves:
   ```bash
   nslookup holomatch.org
   dig holomatch.org
   ```

#### Stage 2: Enable HTTPS (After DNS propagation)

5. **Uncomment Certificate Configuration**: Once DNS has propagated, uncomment the certificate_arn line in main.tf:
   ```terraform
   # In main.tf, change this line:
   # certificate_arn = module.route53.certificate_arn  # Commented out for initial deployment
   # To:
   certificate_arn = module.route53.certificate_arn
   ```

6. **Enable HTTPS Listener**: Uncomment the HTTPS configuration in `modules/ecs/frontend/https.tf`

7. **Apply HTTPS Configuration**:
   ```bash
   terraform plan
   terraform apply
   ```

### Important Notes:

- **Two-stage deployment is required** because the SSL certificate validation depends on DNS being properly configured
- The initial deployment will make your site available at http://holomatch.org
- After Stage 2, your site will have HTTPS with automatic HTTP redirects
- Certificate validation is automatic once DNS propagates

### Outputs Available:

- `hosted_zone_name_servers`: The name servers to configure in your domain registrar
- `website_url`: The final URL of your website (https://holomatch.org)
- `load_balancer_dns_name`: Direct ALB URL for testing

### Troubleshooting:

- If certificate validation fails, ensure DNS has fully propagated
- Use `terraform apply -target=module.route53` to apply Route53 changes first
- Check certificate status in AWS Console > Certificate Manager
