<a id="top"></a>

# Setup 03 - AWS VPC Network

## 1. Objective

Build a secure, segmented AWS network for the migrated customer portal.

---

## 2. VPC Design

| Item | Value |
|---|---|
| VPC CIDR | 10.20.0.0/16 |
| Availability Zones | 2 |
| Public Subnets | 2 |
| Private App Subnets | 2 |
| Private DB Subnets | 2 |
| Internet Gateway | Yes |
| NAT Gateway | Yes, one for lab; two for higher availability |
| DNS Hostnames | Enabled |
| DNS Resolution | Enabled |

---

## 3. Subnet Plan

| Subnet | CIDR | Availability Zone | Purpose |
|---|---:|---|---|
| Public A | 10.20.0.0/24 | AZ-A | ALB, NAT |
| Public B | 10.20.1.0/24 | AZ-B | ALB |
| Private App A | 10.20.10.0/24 | AZ-A | EC2 app |
| Private App B | 10.20.11.0/24 | AZ-B | EC2 app |
| Private DB A | 10.20.20.0/24 | AZ-A | RDS |
| Private DB B | 10.20.21.0/24 | AZ-B | RDS |

---

## 4. Step-by-Step Console Build

### Step 1 - Create VPC

- Go to VPC console.
- Create VPC.
- Name: `scos-prod-web-vpc`
- CIDR: `10.20.0.0/16`
- Enable DNS hostnames and DNS resolution.

### Step 2 - Create Subnets

Create six subnets based on the table above.

### Step 3 - Create Internet Gateway

- Name: `scos-prod-web-igw`
- Attach to the VPC.

### Step 4 - Create NAT Gateway

- Create NAT Gateway in Public Subnet A.
- Allocate Elastic IP.
- Name: `scos-prod-web-nat-a`.

For production high availability, use one NAT Gateway per Availability Zone and route each private subnet to the NAT in the same AZ.

### Step 5 - Create Route Tables

Public route table:

```text
0.0.0.0/0 -> Internet Gateway
```

Private application route table:

```text
0.0.0.0/0 -> NAT Gateway
```

Private database route table:

```text
Local route only
```

### Step 6 - Associate Route Tables

- Public subnets -> Public route table
- Private app subnets -> Private app route table
- Private DB subnets -> Private DB route table

---

## 5. Validation

| Test | Expected Result |
|---|---|
| ALB in public subnet | Can receive internet traffic |
| EC2 in private app subnet | No public IP |
| EC2 outbound patching | Works through NAT Gateway |
| RDS in DB subnet | Not publicly accessible |
| VPC DNS | Internal AWS DNS resolves |

---

## 6. Common Issues

| Issue | Cause |
|---|---|
| Private EC2 cannot update packages | Missing NAT route or NACL problem |
| ALB not reachable | Public route table, security group, or listener issue |
| RDS publicly reachable | Public access was enabled by mistake |
| VPC peering fails later | Overlapping CIDR ranges |

[⬆ Back to Top](#top)
