import 'package:dart_openai/dart_openai.dart';

class OpenaiClass {
  initializeOpenAI() {
    OpenAI.requestsTimeOut = Duration(seconds: 120);
    OpenAI.baseUrl =
        "https://api-inference.huggingface.co/models/Qwen/Qwen2.5-72B-Instruct";
    OpenAI.showResponsesLogs = true;
  }

  Future<String> CreateChatCompletion(String text) async {
    OpenAIChatCompletionChoiceMessageModel contentmassage =
        OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "How Can I Cook $text",
          ),
        ]);

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "Qwen/Qwen2.5-72B-Instruct",
      messages: [contentmassage],
      maxTokens: 500,
    );
    return chatCompletion.choices.first.message.content!.first.text!;
  }
}
