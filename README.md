# Description

Patterns for integrating and deploying infrastructure.

Currently Terraform is set up to apply an ArgoCD Application that pulls a Helm chart from a GitHub repo.

The chart is updated on pushes to `main` using Helm's chart-releaser-action. More info [here](https://github.com/helm/chart-releaser-action).

A GitHub Page was created for https://jbutcher93.github.io/platform/ so that I could use GitHub as a chart repository.