## Build and Run Sitespeed.

1. Go to the [API page](https://cloud.digitalocean.com/settings/api/tokens) and create a token.
1. Run `export DIGITALOCEAN_API_TOKEN=xxxxx` with your API token replacing the xxxxx's. 
1. Run `cd packer`
1. Run `packer build sitespeed.json`
1. This will build a snapshot image used by terraform in the next steps.
1. Run `cd ../terraform/`
1. Run `export DIGITALOCEAN_TOKEN=xxxxx` with your API token replacing the xxxxx's. 
1. Run `terraform apply`
1. Enter your fingerprint id so you are able to ssh into the instance once up.
1. Once the instance is up you can ssh using `ssh root@<instnace ip here>`
1. On the new server you should be able to access grafana using `<instance ip here>:3000` or graphite `<instance ip here>:8080` in the browser of your choice.
