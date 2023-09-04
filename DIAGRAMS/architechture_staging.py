from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import ECS, Fargate
from diagrams.aws.network import ELB, Route53,InternetGateway
from diagrams.aws.storage import S3
from diagrams.aws.database import RDSPostgresqlInstance
from diagrams.aws.storage import Backup
from diagrams.aws.network import CloudFrontEdgeLocation

with Diagram("Peach API Architecture|Staging", show=False):
    # Step 1: Setup Load Balancer and Proxy
    with Cluster("Load Balancer and Proxy"):
        elb = ELB("ELB")

    # Step 2: Deploy Peach API Application (Django)
    with Cluster("Application"):
        ecs_cluster = ECS("ECS Cluster")
        fargate = Fargate("Fargate")
        s3_static = S3("S3 (Static Files)")
        ecr = Edge(label="ECR (Elastic Container Registry)")

    # Step 3: Configure RDSPostgresqlInstance Database (PostgreSQL)
    with Cluster("Database (PostgreSQL)"):
        rds = RDSPostgresqlInstance("RDS")

    # Step 4: Manage Media Files with S3 and CloudFront
    with Cluster("Media Files Storage"):
        s3_media = S3("S3 (Media)")

    # Amazon Route 53 for DNS Management
    with Cluster(""):
        gateway = InternetGateway("internetgateway")

    # Connect the components
    elb >> ecs_cluster >> fargate
    fargate >> s3_static
    fargate >> rds
    fargate >> ecr
    fargate >> s3_media
    ecr >> ecs_cluster
    elb >> InternetGateway

# Generate the diagram
diagram = Diagram("PeachAPI|Staging")
diagram.render()
