Hello Smoltech,

There are various ways to retrive logs for a deployment. One way is to use the railway CLI. The `deploy-logs.sh` script in this repo uses the railway CLI to save the logs to a file. Here are instructions to install the CLI if you have not done so already

<https://docs.railway.app/develop/cli>

Make sure to authenticate and link to your project
```
railway login
railway link
```

After linking your project, you can run the `deploy-logs.sh` script in this repo.
```
curl https://raw.githubusercontent.com/pmcmanaman/bash-and-dash/main/deploy-logs.sh --output deploy-logs.sh --silent
chmod +x deploy-logs.sh
./deploy-logs.sh
```

The script will ask for your project directory and will launch a railway CLI process in the background and save logs to `deploy.log` in the project directory. Run the `deploy-logs.sh` script again to stop the process and logging.

> **_NOTE:_**  The deploy-logs.sh script has only been tested on Linux. It should also work on macOS, but could need some modifying.


Another option is to use the public API

<https://docs.railway.app/reference/public-api>

Implementing the `deploymentLogs` subscription allows for streaming of logs for a deployment. More information can be found in the docs on the GraphiQL playground

<https://railway.app/graphiql>

Rust code from our CLI may also be helpful for reference
<https://github.com/railwayapp/cli/blob/master/src/subscription.rs>
<https://github.com/railwayapp/cli/blob/master/src/gql/subscriptions/strings/DeploymentLogs.graphql>
