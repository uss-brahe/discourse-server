# Introduction
This CloudFormation template is designed to instantiate an EC2 instance with supporting volumes, networking, and encryption requirements.

# Procedure
The procedure outlined herein only covers how to generate the basic infrastructure of a Discourse server. It is not a [comprehensive guide](https://www.axelfernandes.com/how-to-configure-discourse-on-amazon-web-services-aws) for creating Discourse servers.

1 - Create an [EC2 KeyPair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
2 - Execute the [discourse-cloudformation.yaml](discourse-cloudformation.yaml) file in CloudFormation
3 - ssh into the newly created resource and execute `sudo sh post-cloudformation.sh` to mount the external volume and clone the discourse client
4 - Create an [SMTP user account under IAM](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/smtp-credentials.html)
5 - Launch the Discourse installation / configuration script located in `/mnt/xvdh/discourse`
