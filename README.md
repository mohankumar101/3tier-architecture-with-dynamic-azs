# 3tier-architecture-with-dynamic-azs
3tier architecture with dynamic availability zone discovery and deployment
* Built logic for dynamic AZ resolution and deploying infra on all available AZs
  * This can further be tweaked for some custom conditions like an instance_type availability etc
* Built a bastion host based SSH access network, so all the web/app tier machines stay within a private network behind load balancers.
    * Only way of accessing them via SSH is via bastion host
 
To-do plans:
  * will add logic to route53 as and when I get time so it stays as one single infra
  * Will also modularize the entire deployment so it can be imported as modules rather than hefty codes
