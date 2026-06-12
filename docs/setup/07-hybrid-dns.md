<a id="top"></a>

# Setup 07 - Hybrid Connectivity and DNS

## 1. Objective

Plan how the on-premises office connects to AWS during and after migration.

For many small businesses, migration is not an instant replacement. A hybrid period usually exists where some systems remain on-premises while others run in AWS.

---

## 2. Connectivity Options

| Option | Use Case |
|---|---|
| Site-to-Site VPN | Encrypted connection over internet, good for small-to-medium environments |
| Direct Connect | Dedicated private connection for larger or latency-sensitive environments |
| Client VPN | Remote user access to AWS resources |
| VPC Peering | Connect two VPCs privately |
| Transit Gateway | Central hub for many VPCs and networks |

---

## 3. Suggested First Phase

For Southern Cross Office Supplies:

- Use Site-to-Site VPN between Adelaide office firewall and AWS VPC.
- Keep internal admin access restricted.
- Use Route 53 private hosted zones if needed.
- Avoid exposing admin services to the public internet.

---

## 4. DNS Plan

| Name | Target |
|---|---|
| portal.southerncross.example | CloudFront or ALB |
| db.internal.southerncross.example | RDS endpoint CNAME if appropriate |
| logs.internal.southerncross.example | Internal log service |
| oldportal.southerncross.example | Temporary rollback endpoint |

---

## 5. DNS Cutover Checklist

- Lower TTL before migration window.
- Confirm new endpoint works.
- Confirm SSL certificate.
- Confirm rollback DNS record.
- Update public DNS.
- Monitor traffic.
- Keep old environment available during rollback window.

---

## 6. Common Hybrid Problems

| Problem | Cause |
|---|---|
| VPN tunnel down | Firewall config, PSK, route, BGP issue |
| AWS cannot reach on-prem server | Missing route or firewall rule |
| On-prem cannot resolve AWS internal name | DNS forwarding not configured |
| Users connect to old site | DNS cache or TTL |
| IP conflict | Overlapping VPC and office CIDR |

[⬆ Back to Top](#top)
