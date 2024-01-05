# Helm Chart for Consumer Platform Router

Steps for deploying this helm chart into the existing CP cluster. 

In terraform, create the namespace for the brand. 

In terraform, create any secrets used by the router. Typically this will only include the APOLLO_KEY. 

Deploy the helm chart manually or if you want to do it right, using Argo (detailed steps to come)