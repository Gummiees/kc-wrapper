# flutter_application_1

This is a project to check if the development works with ComPsych or not, assuming that the WebView permissions are the lowest and that the Android permissions on the manifest also are.

## To use it as a mock

When launching the app, both on Android or iOS, you will find only a button which opens the preselected customer against STG. With that you can test if everything works.

The problem is that to test you have to push against hotfix/7.12.2 and wait for the web deployment.

I removed the security from hotfix/* so you can push without PRs or merge without approvals.

Testing with a realistic device might be more desirable if possible :) 