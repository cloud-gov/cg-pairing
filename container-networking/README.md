# Container Networking

          _                 _
         | |               | |
      ___| | ___  _   _  __| |  __ _  _____   __
     / __| |/ _ \| | | |/ _` | / _` |/ _ \ \ / /
    | (__| | (_) | |_| | (_| || (_| | (_) \ V /
     \___|_|\___/ \__,_|\__,_(_)__, |\___/ \_/
                                __/ |
                               |___/

                     _        _
                    | |      (_)
      ___ ___  _ __ | |_ __ _ _ _ __   ___ _ __
     / __/ _ \| '_ \| __/ _` | | '_ \ / _ \ '__|
    | (_| (_) | | | | || (_| | | | | |  __/ |
     \___\___/|_| |_|\__\__,_|_|_| |_|\___|_|
               | |                    | |  (_)
     _ __   ___| |___      _____  _ __| | ___ _ __   __ _
    | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / | '_ \ / _` |
    | | | |  __/ |_ \ V  V / (_) | |  |   <| | | | | (_| |
    |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\_|_| |_|\__, |
                                                     __/ |
                                                    |___/

Welcome to the cloud.gov Container Networking pairing scenario. You will be
walking through deploying a number of cloud.gov applications written in Go.
These applications will be leveraging the Cloud Foundry container networking
feature to communicate with one another. You will be interacting with the
`backend` applications via the text inputs found in the `frontend` application.

_Remember that this is a pairing scenario. While completing the entire scenario
is the a goal of this exercise, you will be mostly judged based on your answers
to questions from your pairing buddy and observations you make during
this exercise._

## Begin by logging in and targeting your organization and space

Login into your cloud.gov account the pairing credentials provided by the pairing buddy.

```shell
cf login -a https://api.fr.cloud.gov -u <USERNAME> -p <PASSWORD>
```

Target your organization and space provided by your pairing buddy.

```shell
cf target -o pairing-interview -s <FIRST_NAME>.<LAST_NAME>
```

## Deploy the frontend application

The `frontend` application uses the Go buildpack to deploy and run the
application. You can find the contents of this application in the `frontend/`
directory.

> **Please review the contents of this directory with your pairing buddy and explain
> what you see.**

Once you've successfully reviewed the contents of this directory, change
directories to the `ci/` directory. From inside the `ci/` directory, run the
following command.

```shell
./deploy-frontend.sh
```

> **Please review the output of this command and discuss it with your pairing
> buddy.**

Once you've successfully ran the `./deploy-frontend.sh` file, your application
should be deployed to cloud.gov.

> **Review the output from the successful deployment of your application. Discuss
> any warnings or errors with your pairing buddy.**

Navigate to your `frontend` application using the route found in the `routes:`
property showing the health and status for your running application.

> **Ask your pairing buddy for a hint, if you're stuck.**

Once you've navigated to the running app, keep the browser window open and
come back to your terminal.

## Deploy the backend-a application

The `backend-a` application uses the Go buildpack to deploy and run the
application. You can find the contents of this application in `backend-a/`
directory.

> **Please review the contents of this directory with your pairing buddy and
> explain what you see.**

Once you've reviewed and explained the contents of this directory, change
directories to the `ci/` directory. From inside the `ci/` directory, run the
following command.

```shell
./deploy-backend.sh
```

Because the `backend-a` is going to be an internal-facing application, it will
require a specific domain called `apps.internal`. Use this domain when deploying
the `backend-a` application. More information on this can be found in the
[cf-networking-release][docs-cfnr] documentation about internal domains.

[docs-cfnr]: https://github.com/cloudfoundry/cf-networking-release/blob/develop/docs/app-sd.md#internal-domains

> **Please review the output of this command and discuss it with your pairing
> buddy.**

Once you've successfully ran the script, your application should be deployed to
cloud.gov.

> **Review the output from the successful deployment of your application. Discuss
> any warnings or errors with your pairing buddy.**

Review the output of the health and status of your `backend-a` application.
Remember the `routes:` property for the next step.

> **Ask your pairing buddy for a hint, if you're stuck.**

Go to the running `frontend` application you left open in the previous step.
Using the **HTTP Test** _Backend HTTP URL_ labeled text box, enter the route for
your `backend-a` application allow with the TCP port used in the deployment
script.

> **Ask your pairing buddy for a hint, if you're stuck on where to find the TCP
> port used by the `backend-a` application.**

The request should fail. Review the error message found in your browser
window. Use the [Cloud Foundry container networking][docs-cfcn] documentation as
a starting point in troubleshooting the problem.

> **Troubleshoot the issue with your pairing buddy using the documentation
> mentioned above.**

[docs-cfcn]: https://docs.cloudfoundry.org/concepts/understand-cf-networking.html#policies

### Setup the TCP network policies for backend-a

In order to allow traffic to the `apps.internal`, you'll have to setup a network
policy as described in documentation above. After changing directories to the
`ci/` directory, run the following command.

```shell
./allow-tcp-policy.sh
```

> **Please review the output of this command and discuss it with your pairing
> buddy.**

After successfully adding a TCP policy for your `frontend` and `backend-a`
applications, go back to your browser window.

Using the **HTTP Test** _Backend HTTP URL_ labeled text box, enter the route for
your `backend-a` application allow with the TCP port used in the deployment
script.

### Setup the UDP network policies for backend-a

## Deploy the backend-b application

### Make backend-a and backend-b available at the same route
