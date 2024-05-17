# Github Actions - Environments, Git Tags & Deployments

## Summary
Today, we will be attempting to create Environments, Git Tags & Releases, & build Docker images based on environments

## Environments
We will be creating several environments today.
- DEV
- UAT
- PROD

<img width="1436" alt="Screenshot 2024-05-18 at 7 15 14 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/b9261925-2b76-4518-9e0a-398b9f1cf424">

In order to create the above environments, go to Settings > Environments > New Environment. Input the New Environment e.g. DEV > Configure Environment.

<img width="827" alt="Screenshot 2024-05-18 at 7 16 37 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/a8b1c34a-a9ba-4f16-aed3-cdf5c670a620">

Ideally, we should enable "Required Reviewers" & "Prevent Self-Review", which requires engineers to get approval from other team members who will need to approve the pipeline before the application is deployed to that particular environment. This is exceptionally important in PROD environment.

<img width="812" alt="Screenshot 2024-05-18 at 7 19 20 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/c21f740c-4c7e-4227-b2d0-9f91ef8aa178">

You can also set Environment Secrets and Variables, which will override Repository Secrets and Variables, which will be specific to that particular environment.

Another key feature would be to enable Deployment Branches & Tags for particular branches. A standard would be for example:
- DEV --> Any branches can be deployed to DEV env
- UAT --> Only release/** branches can be deployed to UAT env
- PROD --> Only release/** & hotfix/** branches can be deployed to PROD env

A sample in DEV:

<img width="794" alt="Screenshot 2024-05-18 at 7 22 34 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/e0c5a3d0-dbf3-457b-b549-8a824eec7bdd">

A sample in UAT:

<img width="802" alt="Screenshot 2024-05-18 at 7 23 05 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/0512b7cd-87a6-4e2e-a490-0bc05d928226">

A sample in PROD:

<img width="802" alt="Screenshot 2024-05-18 at 7 23 30 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/b995b950-c00c-4ce6-9e7b-b92b82881724">

## Creating Git Tags & Releases
Tags will be used when we are preparing for UAT and PROD environments for Docker images. In DEV environments, we can stick to "latest" tag, but in UAT and PROD, we can incrementally increase the version with each releases e.g. v1.0.1 --> v1.0.2 --> v1.1.1 --> v.1.1.2 etc.

<img width="1433" alt="Screenshot 2024-05-18 at 7 24 46 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/685276bb-293b-4cea-95d5-4c5d476f17f9">

In order to view tags, in the main page, click the "tags" button next to "branches" button.

<img width="1427" alt="Screenshot 2024-05-18 at 7 27 36 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/127ecd07-efe3-4740-9c52-6c02ce619803">

Here, you will see all the tags available. To create tags, go to "Releases" tab and click "Draft a new release"

<img width="1242" alt="Screenshot 2024-05-18 at 7 28 34 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/9fee6c06-180c-42a9-8d99-c76e27b615ee">

You can input a version tag from the tag dropdown and click "Create new tag". Ensure that you choose the right branch as the target.

<img width="1326" alt="Screenshot 2024-05-18 at 7 28 58 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/49341aa5-6850-4af7-b49b-7499584a5ce2">

<img width="1286" alt="Screenshot 2024-05-18 at 7 30 02 AM" src="https://github.com/luqmannnn/github-actions-env-selection/assets/9068525/9ebbe333-ac1c-4c60-9264-1938f5954f0f">

Once done, click "Publish Release"

## Deployments
We will next create 2 yaml files - 1 for CI and 1 for CD, with the CI file making workflow calls to the CD file to allow automatic deployments to the target environment based on your branch.

