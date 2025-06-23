const AWS = require("aws-sdk");
const sns = new AWS.SNS();

exports.subscribeHandler = async (event) => {
  try {
    const body = JSON.parse(event.body);
    const email = body.email;

    if (!email) {
      return {
        statusCode: 400,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Content-Type",
          "Access-Control-Allow-Methods": "OPTIONS,POST"
        },
        body: JSON.stringify({ message: "Email is required" }),
      };
    }

    const topicArn = process.env.SNS_TOPIC_ARN;

    const result = await sns.subscribe({
      Protocol: "email",
      TopicArn: topicArn,
      Endpoint: email,
      ReturnSubscriptionArn: true
    }).promise();

    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type",
        "Access-Control-Allow-Methods": "OPTIONS,POST"
      },
      body: JSON.stringify({
        message: `Subscription request sent to ${email}. Please check your inbox to confirm.`,
        subscriptionArn: result.SubscriptionArn
      }),
    };

  } catch (error) {
    console.error("Subscription Error:", error);
    return {
      statusCode: 500,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type",
        "Access-Control-Allow-Methods": "OPTIONS,POST"
      },
      body: JSON.stringify({ message: "Failed to subscribe.", error: error.message }),
    };
  }
};
