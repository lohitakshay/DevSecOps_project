# Automated DevSecOps Pipeline

## Overview

The DevSecOps Project repository is dedicated to demonstrating the integration of DevOps practices with robust security measures. This project automates the entire process of continuous integration (CI) and continuous deployment (CD) while embedding security checks at every stage of the pipeline. The aim is to ensure that code is not only efficiently developed and deployed but also thoroughly vetted for security vulnerabilities, thereby fostering a secure software development lifecycle.


## Features

- **CI/CD Pipeline**: Automates the build, test, and deployment processes.
- **Security Scans**: Integrated security analysis tools such as SonarQube, Trivy, and OWASP ZAP to identify vulnerabilities in code and container images.
- **Containerization**: Uses Docker to containerize the application.
- **Kubernetes Deployment**: Deploys the application to a Kubernetes cluster.
- **Monitoring**: Integrated Grafana and Prometheus for comprehensive monitoring and visualization of metrics.
- **Notifications**: Sends email notifications on pipeline status.

## Tools & Technologies

- **Jenkins**: Orchestrates the CI/CD pipeline, managing job execution.
- **Docker**: Containerizes the application, ensuring consistency across environments.
- **Kubernetes**: Manages the deployment, scaling, and operations of containerized applications.
- **SonarQube**: Analyzes code quality and security, providing insights into code health.
- **Trivy**: Scans Docker images for vulnerabilities, ensuring secure container deployments.
- **OWASP ZAP**: Performs security testing on web applications, identifying potential vulnerabilities.
- **Grafana**: Provides visualization and analysis of metrics and logs, facilitating easy monitoring.
- **Prometheus**: Collects and stores metrics from various sources, used in conjunction with Grafana for monitoring.

## Installation & Setup

### Prerequisites

- **Jenkins**: Ensure Jenkins is installed and running. You can download it from [Jenkins' official site](https://www.jenkins.io/download/).
- **Docker**: Install Docker to handle containerization. Installation instructions are available on [Docker's website](https://docs.docker.com/get-docker/).
- **Kubernetes**: Set up a Kubernetes cluster. You can use a managed Kubernetes service or set up your own cluster.
- **SonarQube**: Install and configure SonarQube for code analysis. Refer to [SonarQube's documentation](https://docs.sonarqube.org/latest/).
- **Trivy**: Install Trivy for Docker image scanning. Installation guides are available on [Trivy's GitHub page](https://github.com/aquasecurity/trivy).
- **OWASP ZAP**: Install OWASP ZAP for security testing. Find installation details on the [OWASP ZAP website](https://owasp.org/www-project-zap/).
- **Grafana**: Set up Grafana for monitoring and visualization. Visit the [Grafana documentation](https://grafana.com/docs/grafana/latest/getting-started/) for installation instructions.
- **Prometheus**: Install Prometheus for metrics collection and monitoring. Installation information can be found on the [Prometheus website](https://prometheus.io/docs/prometheus/latest/installation/).

### Step-by-Step Guide

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/lohitakshay/DevSecOps_project.git
    cd DevSecOps_project
    ```

2. **Configure Jenkins**:

    - Set up Jenkins jobs using the provided `jenkins_pipeline` file in the repository.
    - Install necessary plugins as specified in the `plugins.txt` file. To install the plugins:
    
      1. Navigate to Jenkins Dashboard > Manage Jenkins > Manage Plugins.
      2. Go to the "Available" tab and use the `plugins.txt` file to search and install required plugins.
    - Configure Jenkins credentials for email notifications.

3. **Docker & Kubernetes Setup**:

    - Build Docker images using the provided `devsec.dockerfile`:
    
      ```bash
      docker build -t myapp:latest -f devsec.dockerfile .
      ```
    - Deploy the application to Kubernetes using the provided Kubernetes deployment files:
    
      ```bash
      kubectl apply -f devsec_kub.yaml
      kubectl apply -f devsecops-app.yaml
      ```

4. **Security Tools Configuration**:

    - Configure SonarQube, Trivy, and OWASP ZAP according to your project requirements. Ensure that SonarQube is properly connected to Jenkins for code analysis.
    - Use the provided Bash scripts for Prometheus and Grafana to facilitate setup:
      
      - **Prometheus**: `prometheus-setup.sh`
      - **Grafana**: `grafana-setup.sh`
      
      Run these scripts to automate the installation and configuration of Prometheus and Grafana:
      
      ```bash
      bash prometheus-setup.sh
      bash grafana-setup.sh
      ```

5. **Monitoring Setup**:

    - Integrate Grafana and Prometheus into your setup for monitoring and visualizing metrics.
    - Refer to the official websites for Grafana and Prometheus for additional setup details:
      - [Grafana Installation Guide](https://grafana.com/docs/grafana/latest/getting-started/)
      - [Prometheus Installation Guide](https://prometheus.io/docs/prometheus/latest/installation/)

6. **Run the Pipeline**:

    - Trigger the Jenkins pipeline to start the CI/CD process. Monitor the pipeline execution and review the results in Jenkins.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## Contact

For any queries, please reach out to Lohitakshay.

---
