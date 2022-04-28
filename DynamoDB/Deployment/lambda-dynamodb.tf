resource "aws_dynamodb_table" "music-dynamodb-table" {
    name = "Music"
    hash_key = "Artist"
    range_key = "SongTitle"
    attribute {
        name= "Artist"
        type = "S"
    }
    attribute {
        name="SongTitle"
        type="S"
    }
    read_capacity=5
    write_capacity=5
}

resource "aws_lambda_function" "music-lambda" {
    filename = "/home/ullasa/extra/AWS-Lamda-Basics/DynamoDB/music-dynamodb-package.zip"
    function_name = "music-lambda"
    handler = "readwrite.dynamodbHandler"
    runtime ="python3.9"
    role = "arn:aws:iam::135566327975:role/ullasasindhur"
}