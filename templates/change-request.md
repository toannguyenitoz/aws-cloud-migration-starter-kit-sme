# Change Request

## Change Title

Move Customer Order Portal DNS to AWS ALB

## Business Reason

Improve availability and scalability of customer ordering portal.

## Planned Date / Time

TBD

## Systems Affected

- Customer order portal
- Public DNS
- RDS database
- Application Load Balancer

## Pre-Change Checklist

- Backup completed
- Rollback plan approved
- Stakeholders notified
- Monitoring ready
- ALB targets healthy

## Implementation Steps

1. Put old application into maintenance mode.
2. Perform final database sync.
3. Update DNS record.
4. Validate application.
5. Monitor logs.

## Rollback Steps

1. Repoint DNS to old endpoint.
2. Confirm old app availability.
3. Notify users.
4. Capture logs.

## Approval

| Role | Name | Approved |
|---|---|---|
| Business Owner |  |  |
| Technical Owner |  |  |
