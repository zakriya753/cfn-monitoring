This is the serverless app monitoring templates.

Strategy
- AWS Nested Stack Approach is used to create templates.

Cfn Folder:
- The main folder has the driver file which is used to create all the alarms by invoking the child stacks in modules.
- The main can be extended to add more resources, for one it is done one resource per server.
Example:
- module file of lambda implements 4 most used metric alarms and it is drived based on lambdaFunctionName parameter and awsEnv.
- The main file invokes lambda child template with lambdaFunctionName which integrates the alarms with that particular function.
- For multiple function edit in main file and add another resource with different lambdaFunctionName name to integrate metrics with that function as well.

Bin Folder:
This folder has the cli commands to create the resources and to sync artifacts to s3 for nested stack usage.
This uses the secret key and access which you configured in your local machine.
The first step is to sync the artifacts with s3.
Second step is to go to the main folder and run the create stack command
