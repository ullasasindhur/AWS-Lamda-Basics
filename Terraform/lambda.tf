resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "python_lambda" {
    filename = "../Python Lambda/python-lambda.zip"
    function_name = "ullasasindhur"
    role = aws_iam_role.iam_for_lambda.arn
    handler = "ullasasindhur.request_handler"
    source_code_hash = filebase64sha256("../Python Lambda/python-lambda.zip")
    runtime = "python3.9"
}