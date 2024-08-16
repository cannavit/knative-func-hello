
If you want do one deploy of the function view this

    https://github.com/knative/func/blob/main/docs/building-functions/on_cluster_build.md


kubectl create secret docker-registry <registry-credential-secrets> \
  --docker-server=<private-registry-url> \
  --docker-email=<private-registry-email> \
  --docker-username=<private-registry-user> \
  --docker-password=<private-registry-password>

kubectl patch serviceaccount default -p "{\"imagePullSecrets\": [{\"name\": \"container-registry\"}]}"


func deploy --remote --registry ghcr.io/cannavit/knative-func-hello --git-url https://github.com/cannavit/knative-func-hello.git -p test


# TESTING BUIDS 

kn func deploy --remote --builder s2i --registry ghcr.io/cannavit --git-url https://github.com/cannavit/knative-func-hello.git -p hello-py


kn func deploy --remote --registry ghcr.io/cannavit --git-url https://github.com/cannavit/knative-func-hello.git -p test



# CONFIGURAR ARUIQTECTURA CORRECTA CON 
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
