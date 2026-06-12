<a id="top"></a>

# AWS Cloud Migration Troubleshooting Guide

## 1. Website Is Not Loading

Check:

1. DNS record points to ALB or CloudFront.
2. ALB listener exists on port 80 or 443.
3. ALB Security Group allows inbound traffic.
4. Target group has healthy targets.
5. EC2 instances are running.
6. Application service is running.
7. Health check path exists.

Useful commands:

```bash
curl -I http://<alb-dns-name>
curl http://localhost/health.html
sudo systemctl status httpd
```

---

## 2. ALB Shows 503

Likely cause: no healthy targets.

Check:

- Target group health
- App Security Group allows ALB traffic
- Health check path
- Web server port
- NACL rules

---

## 3. EC2 Cannot Access Internet

Check:

- EC2 is in private app subnet.
- Private route table has `0.0.0.0/0` to NAT Gateway.
- NAT Gateway is in public subnet.
- Public subnet route table has `0.0.0.0/0` to Internet Gateway.
- NACL allows outbound and return traffic.
- DNS resolution is enabled.

---

## 4. RDS Connection Fails

Check:

- RDS endpoint is correct.
- RDS is not publicly exposed.
- Application Security Group is allowed in RDS Security Group.
- Correct database port.
- Database username and password.
- Database subnet group.
- RDS status is available.

Test:

```bash
mysql -h <endpoint> -P 3306 -u <user> -p
```

---

## 5. Auto Scaling Not Working

Check:

- Launch Template version.
- AMI exists.
- IAM instance profile.
- Subnets selected.
- Security Group selected.
- Desired/min/max capacity.
- CloudWatch alarm state.
- Scaling policy.
- Service quotas.

---

## 6. High AWS Bill

Check:

- NAT Gateway running hours.
- RDS instance class and storage.
- Idle EC2 instances.
- Old snapshots.
- Unattached EBS volumes.
- CloudWatch log retention.
- Data transfer.
- ALB running unnecessarily.

---

## 7. S3 Access Denied

Check:

- IAM role attached to EC2.
- Bucket policy.
- Object prefix.
- S3 Block Public Access settings.
- KMS key permissions if encrypted.
- Region and bucket name.

---

## 8. DNS Issue

Check:

- Public hosted zone.
- Record name.
- TTL.
- Old cached DNS result.
- Certificate domain name.
- CloudFront distribution if used.
- ALB DNS name.

[⬆ Back to Top](#top)
