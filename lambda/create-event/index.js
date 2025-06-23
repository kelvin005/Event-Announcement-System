const AWS = require("aws-sdk");
const sns = new AWS.SNS();

exports.createEventHandler = async (event) => {
  try {
    const body = JSON.parse(event.body);

    const title = body.title;
    const description = body.description;

    if (!title || !description) {
      return {
        statusCode: 400,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*"
        },
        body: JSON.stringify({ message: "Title and description are required" }),
      };
    }

    const topicArn = process.env.SNS_TOPIC_ARN;

    const message = `📣 *New Event Announced*\n\n**Title**: ${title}\n\n**Description**: ${description}`;

    await sns.publish({
      TopicArn: topicArn,
      Subject: `New Event: ${title}`,
      Message: message,
    }).promise();

    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type"
      },
      body: JSON.stringify({ message: "Event created and announcement sent!" }),
    };

  } catch (error) {
    console.error("Event creation error:", error);
    return {
      statusCode: 500,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "*"
      },
      body: JSON.stringify({ message: "Failed to create event", error: error.message }),
    };
  }
};
