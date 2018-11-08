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

## Step 1

Login into your cloud.gov account

```shell
cf login -a https://api.fr.cloud.gov --sso
```

```shell
cf target -o pairing-interview -s <FIRST_NAME>.<LAST_NAME>
```

## Step 2

Deploy the applications. Start by using the deployment scripts provided in the
`ci/` directory. Deploy the frontend application using the `deploy-frontend.sh`
script. Deploy the backend applications using the `deploy-backend.sh` script.

## Step 3

Setup the container networking for the various communication between
the frontend and backend applications. Use the provided scripts in the `ci/`
directory. For TCP connections, use the `allow-tcp-policy.sh`. For UDP
connections, use the `allow-udp-policy.sh`. To remove all network policies, use
the `remove-all-policies.sh` script.
