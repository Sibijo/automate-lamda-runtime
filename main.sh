#step 1: Get the list of available regions
regions=$(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text)

# Step 2: Iterate over each region
 for region in $regions; do
   echo "Checking Lambda runtimes in region: $region"

#       # Step 3: Get the list of Lambda functions in the current region
         lambda_functions=$(aws lambda list-functions --query 'Functions[*].FunctionName' --output text --region $region)
#
#           # Step 4: Iterate over the list and get the runtime for each function
             for function_name in $lambda_functions; do
                 runtime=$(aws lambda get-function --function-name $function_name --query 'Configuration.Runtime' --output text --region $region)
                   
#                         # Step 5: Use grep or any other filtering mechanism
                             if [[ $runtime == *"python"* ]]; then
                                   echo "Function: $function_name, Runtime: $runtime"
                                       fi
                                         done
                                         done